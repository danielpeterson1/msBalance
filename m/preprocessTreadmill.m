function Treadmill = preprocessTreadmill(Treadmill)
nSamp = 50;
ZeroVal = nanmean(Treadmill(:,1:nSamp),2);
Treadmill = Treadmill - repmat(ZeroVal, 1, size(Treadmill,2));
end