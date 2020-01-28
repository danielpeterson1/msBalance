function [wavedata, waveparams] = wavelettransform(data)
% Get the length of the data records
[ntrls,npnts] = size(data);
% Wavelet to use: 3-rd order Coiflet.
wavestr = 'coif3';
% Extension mode: periodic, so that what is returned is the same length as
% the data.
wavemode = 'per';
dwtmode(wavemode);
% Find the maximum possible level of the wavelet decomposition:
lev = wmaxlev([1 npnts],wavestr);
% Loop through and transform
wavedata = zeros(size(data));
for i = 1:ntrls
    x = data(i,:);
    [wx,wL] = wavedec(x,lev,wavestr);
    wavedata(i,:) = wx;
end
waveparams.wL = wL;
waveparams.wavestr = wavestr;
waveparams.wavemode = wavemode;
end