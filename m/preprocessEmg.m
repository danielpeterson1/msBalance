function emg = preprocessEmg(emg, fs)
emgOut = nan(size(emg));

for i = 1:size(emg,1)
    in = emg(i,:)';
    out = proc_process_emg(in, fs);
    emgOut(i,:) = out';
end
end

function emg = proc_process_emg(EMG, SampleRate)
% ver. 2 - March 10, 2010 (Jeff Bingham) Switched versioning to mcollapse
% ver. 1 - February 6, 2010 (Jeff Bingham) File created from portions of     
%          the previous 'proc2axis (August 28, 2009)' that were involved
%          with processing EMG data from C3D files.
%
% emg = proc_process_emg(EMG, SampleRate)
%
%            Function that filters and rectifies raw EMG data
%
% #########################################################################
%
%
% SUPPORTING FUNCTIONS:
%
% ARGUMENTS:
%  EMG        [m x n] ... The "m" samples for "n" different EMG channels of
%                         raw unprocessed data
%  SampleRate   INT ..... The rate of samples per second the EMG data was
%                         collected at
%
% OUTPUTS:
%  emg        [m x n] ... The "m" samples of "n" filtered EMG channels
%
% #########################################################################

nyquist_frequency = SampleRate/2;

%%% Create filters
% High pass filter at 35 Hz
[filt_high_B,filt_high_A] = butter(3,35/nyquist_frequency,'high');
% Low pass filter at 40 Hz
[filt_low_B,filt_low_A] = butter(3,40/nyquist_frequency,'low');

%%% Filter EMG signals
% High pass filter at 35 Hz
emg = filtfilt(filt_high_B, filt_high_A,EMG);
% Demean and rectify
emg_mean = repmat(mean(emg(1:SampleRate,:),1),size(emg,1),1);
emg = abs(emg-emg_mean);
% Low pass filter at 40 Hz
emg = filtfilt(filt_low_B, filt_low_A,emg);

end
