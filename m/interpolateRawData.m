function [out, ts] = interpolateRawData(in, fs, ts)

% set output frequency to default if not specified
if nargin<2
    fs = 1000;
end
if nargin<3
    ts = [-0.5:(1/fs):(2.0-(1/fs))];
end

nR = size(in,1);
nC = length(ts);

[e1, e2, e3, e4, p] = deal(nan(nR, nC));

DataError = false(nR, 1);
Participant = string(in.Subj);
Trial = string(in.trial);
try
    Date = in.obsDate;
catch
    Date = NaT(nR,1);
end

for t = 1:nR
    emgTime = in.time{t,:};
    emg1 = in.emg1{t,:};
    emg2 = in.emg1{t,:};
    emg3 = in.emg1{t,:};
    emg4 = in.emg1{t,:};
    treadmillPosition = in.Treadmill_marker_position{t,:};
    treadmillTime = in.Treadmill_Marker_Time{t,:};
%     onsetSample = identifyOnsetSample(treadmillPosition);
%     onsetTime = treadmillTime(onsetSample);
    onsetSample = round(in.perturbationOnset(t));
    onsetTime = in.time{t,onsetSample};
    
    % identify sample frequencies
    sampleFrequencyEmg = 1/(emgTime(2)-emgTime(1));
    sampleFrequencyTreadmill = 1/(treadmillTime(2)-treadmillTime(1));

    % resample signals
    try
    [emg1Res, emg1ResTime] = resample(emg1, emgTime - onsetTime, fs);
    [emg2Res, emg2ResTime] = resample(emg2, emgTime - onsetTime, fs);
    [emg3Res, emg3ResTime] = resample(emg3, emgTime - onsetTime, fs);
    [emg4Res, emg4ResTime] = resample(emg4, emgTime - onsetTime, fs);
    [treadmillPositionRes, treadmillPositionResTime] = resample(treadmillPosition, treadmillTime - onsetTime, fs);
    
    % interpolate to common timebase and save
    e1(t,:) = interp1(emg1ResTime, emg1Res, ts, 'linear', 0)';
    e2(t,:) = interp1(emg2ResTime, emg2Res, ts, 'linear', 0)';
    e3(t,:) = interp1(emg3ResTime, emg3Res, ts, 'linear', 0)';
    e4(t,:) = interp1(emg4ResTime, emg4Res, ts, 'linear', 0)';
    p(t,:) = interp1(treadmillPositionResTime, treadmillPositionRes, ts, 'linear', 0)';
    catch
        DataError(t) = 1;
    end
end

out = table(Participant,Date,Trial,DataError,e1,e2,e3,e4,p);

end

function onsetSample = identifyOnsetSample(treadmill)

nSamp = 50;
nSD = 6;
mnBak = nanmean(treadmill(1:nSamp));
sdBak = nanstd(treadmill(1:nSamp));
treadmill = abs(treadmill - mnBak)/sdBak;
onsetSample = find(treadmill>nSD,1,'first');

end