function ads = getSPCup2022Datastore_evl(root)
% 
% Copyright 2022 The MathWorks, Inc.

ads = audioDatastore(root,"FileExtensions",".wav");
rawlabels = readtable(fullfile(root,"labels.csv"));

filesADS = cellfun(@getFileName,ads.Files,'UniformOutput',false);
filesCSV = rawlabels.track;
[~,~,ind] = intersect(filesADS,filesCSV);

% Arrange labels in the order of the files in the datastore
%labels = categorical(rawlabels.algorithm(ind));
%labelds = arrayDatastore(labels);

%ads = combine(ads,labelds);
reset(ads) %Reset graphics object properties to their defaults
end

function name = getFileName(fullFilePath)
[~,n,ext] = fileparts(fullFilePath);
name = [n,ext];
end