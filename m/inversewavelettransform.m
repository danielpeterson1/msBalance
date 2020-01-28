function data = inversewavelettransform(wavedata,waveparams)
dwtmode(waveparams.wavemode);
% Get the length of the data records
[ntrls,npnts] = size(wavedata);
data = zeros(size(wavedata));
for i = 1:ntrls
    data(i,:) = waverec(wavedata(i,:),waveparams.wL,waveparams.wavestr);
end
end