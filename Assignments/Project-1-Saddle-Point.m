function id = saddle(M)
[a,b]=size(M);
id = zeros(a+b,2);
count = 0;
for i = 1:a
    mah = max(M(i,:));
    [c1,c2] = find(M(i,:) == mah);
    for k = 1:length(c1)
        c1k = c1(k); c2k = c2(k);
        mic = min(M(:,c2k));
        if M(i,c2k)==mic
            count = count+1;
            id(count,:) = [i,c2k];
        end
    end
end
id = id(1:count,:);
end

% create an interesting surface
[X,Y] = meshgrid(-15:0.5:10,-10:0.5:10);
Z = (X.^2-Y.^2)';
% find saddle points
indices = saddle(Z)
% plot surface
surf(Z);
hold on
% mark saddle points with red dots in the same figure
for ii = 1:size(indices,1)
    h = scatter3(indices(ii,2),indices(ii,1),Z(indices(ii,1),indices(ii,2)),'red','filled');
    h.SizeData = 120;
end
% adjust viewpoint
view(-115,14);
hold off