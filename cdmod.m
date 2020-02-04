clc

outfile=[strrep(cdfile,'.txt','') '.ovf'];
outfile=fopen(outfile, 'w');

fprintf(outfile,'# OOMMF: rectangular mesh v1.0\n');
fprintf(outfile,'# Segment count: 1\n');
fprintf(outfile,'# Begin: Segment\n');
fprintf(outfile,'# Begin: Header\n');
fprintf(outfile,'# Title: J\n');
fprintf(outfile,'# meshtype: rectangular\n');
fprintf(outfile,'# meshunit: m\n');
fprintf(outfile,'# xbase: 1e-09\n');
fprintf(outfile,'# ybase: 1e-09\n');
fprintf(outfile,'# zbase: 1e-09\n');
fprintf(outfile,'# xstepsize: %s\n',xcell);
fprintf(outfile,'# ystepsize: %s\n',ycell);
fprintf(outfile,'# zstepsize: %s\n',zcell);
fprintf(outfile,'# xmin: 0\n');
fprintf(outfile,'# ymin: 0\n');
fprintf(outfile,'# zmin: 0\n');
fprintf(outfile,'# xmax: %s\n', xmax);
fprintf(outfile,'# ymax: %s\n', ymax);
fprintf(outfile,'# zmax: %s\n', zmax);
fprintf(outfile,'# xnodes: %s\n', xdim);
fprintf(outfile,'# ynodes: %s\n', ydim);
fprintf(outfile,'# znodes: %s\n', zdim);
fprintf(outfile,'# valuedim: 3\n');
fprintf(outfile,'# valuelabels: J_x J_y J_z\n');
fprintf(outfile,'# valueunits: A/m2 A/m2 A/m2\n');
fprintf(outfile,'# End: Header\n');
fprintf(outfile,'# Begin: Data Text\n');

row=1;
for i=1:length(cd)
    if mod(i-1,str2double(xdim))==0
        clc
        fprintf('Working on row %s of the Current Density OVF\n', int2str(row))
        fprintf('Percent of Current Density OVF Complete > %f%%\n', ((row/str2double(ydim))*100))
        row=row+1;
    end
    for j=3:5
        if isnan(cd(i,j))
            fprintf(outfile,'%2.1f',0);
        else
            fprintf(outfile,strrep(sprintf('%e',cd(i,j)),'e+','E'));
        end
        if j~=5
            fprintf(outfile,' ');
        end
    end
    fprintf(outfile,'\n');
        
end

fprintf(outfile,'# End: Data Test\n');
fprintf(outfile,'# End: Segment\n');

fclose(outfile);