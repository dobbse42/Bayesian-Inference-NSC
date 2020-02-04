clc

outfile=[strrep(mdfile,'.txt','') '.ovf'];
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
fprintf(outfile,'# valuelabels: m_x m_y m_z\n');
fprintf(outfile,'# valueunits: 1 1 1\n');
fprintf(outfile,'# End: Header\n');
fprintf(outfile,'# Begin: Data Text\n');

% row=1;
% inputnum=1;
prevrow=0;
currrow=1;

j=0;
inputnum=0;
firstcell=md(1);
prevfirstcell=NaN;
for i=1:length(md)
%     disp(i)
    if mod(i-1,str2double(xdim))==0
        prevfirstcell=firstcell;
        firstcell=md(i,3);
        j=j+1;
        clc
        fprintf('Working on row %s for the Domains OVF\n', int2str(j))
        fprintf('Percent of Domains OVF Complete > %f%%\n', ((j/str2double(ydim))*100))
        if (firstcell==1)&&(isnan(prevfirstcell))
            inputnum=inputnum+1;
        end
    end
    if (inputnum==0)&&(~isnan(md(i,3)))
        fprintf(outfile, rightmag);
    elseif (inputnum==1)&&(~isnan(md(i,3)))
        if input1==0
            fprintf(outfile, rightmag);
        elseif input1==1
            if mod(i-1,str2double(xdim))<50
                fprintf(outfile, leftmag);
            elseif (mod(i-1,str2double(xdim))>=50)&&(mod(i-1,str2double(xdim))<(50+dww))
                fprintf(outfile, dwmag);
            elseif mod(i-1,str2double(xdim))>=(50+dww)
                fprintf(outfile, rightmag);
            end
        end
    elseif (inputnum==2)&&(~isnan(md(i,3)))
        if input2==0
            fprintf(outfile, rightmag);
        elseif input2==1
            if mod(i-1,str2double(xdim))<50
                fprintf(outfile, leftmag);
            elseif (mod(i-1,str2double(xdim))>=50)&&(mod(i-1,str2double(xdim))<(50+dww))
                fprintf(outfile, dwmag);
            elseif mod(i-1,str2double(xdim))>=(50+dww)
                fprintf(outfile, rightmag);
            end
        end
    elseif (inputnum==3)&&(~isnan(md(i,3)))
        if input3==0
            fprintf(outfile, rightmag);
        elseif input3==1
            if mod(i-1,str2double(xdim))<50
                fprintf(outfile, leftmag);
            elseif (mod(i-1,str2double(xdim))>=50)&&(mod(i-1,str2double(xdim))<(50+dww))
                fprintf(outfile, dwmag);
            elseif mod(i-1,str2double(xdim))>=(50+dww)
                fprintf(outfile, rightmag);
            end
        end
    elseif (inputnum==4)&&(~isnan(md(i,3)))
        if input4==0
            fprintf(outfile, rightmag);
        elseif input4==1
            if mod(i-1,str2double(xdim))<50
                fprintf(outfile, leftmag);
            elseif (mod(i-1,str2double(xdim))>=50)&&(mod(i-1,str2double(xdim))<(50+dww))
                fprintf(outfile, dwmag);
            elseif mod(i-1,str2double(xdim))>=(50+dww)
                fprintf(outfile, rightmag);
            end
        end
    elseif isnan(md(i,3))
        fprintf(outfile, '0.0 0.0 0.0\n');
    end
end

% for i=1:length(md)
%     if mod(i-1,str2double(xdim))==0
%         j=j+1;
%         fprintf('Working on row %s for the Magnetic Domains\n', int2str(j))
% %         row=row+1;
%     end
%     if isnan(md(i,3))
%         fprintf(outfile,'0.0 0.0 0.0\n');
%     elseif (md(i,1))<(0-(((dww)/2)*str2double(xcell)))
%         fprintf(outfile,'0.0 0.0 1.0\n');
%     elseif ((md(i,1))>=(0-(((dww)/2)*str2double(xcell))))...
%             &&((md(i,1))<((((dww)/2)*str2double(xcell))))
%         fprintf(outfile,'0.0 1.0 0.0\n');
%     elseif (md(i,1))>=((((dww)/2)*str2double(xcell)))
%         fprintf(outfile,'0.0 0.0 -1.0\n');
%     end
% end

fprintf(outfile,'# End: Data Test\n');
fprintf(outfile,'# End: Segment\n');

fclose(outfile);