clc
clear all       %#ok<CLALL>
close all

xcell=input('Please input the x-dimension cell size > ', 's');
ycell=input('Please input the y-dimension cell size > ', 's');
zcell=input('Please input the z-dimension cell size > ', 's');

xdim=input('Please input the number of cells in the x-direction > ', 's');
ydim=input('Please input the number of cells in the y-direction > ', 's');
zdim=input('Please input the number of cells in the z-direction > ', 's');

while 1
    dww=input('Please input the desired DW width, in cells > ');
    if (mod(dww,2)~=0)||(dww<=0)
        disp('Please enter an even and positive value for the DW width.')
    else
        break;
    end
end

input1=logical(input('Please enter the value of the first input > '));
input2=logical(input('Please enter the value of the second input > '));
input3=logical(input('Please enter the value of the third input > '));
input4=logical(input('Please enter the value of the fourth input > '));

input1=~input1;
input2=~input2;
input3=~input3;
input4=~input4;

disp('Please enter the initial magnetization state of the output:')
disp('1.  +x')
disp('2.  -x')
disp('3.  +z')
disp('4.  -z')
magstate=input('> ');

if magstate==1
    leftmag=('-1.0 0.0 0.0\n');
    rightmag=('1.0 0.0 0.0\n');
elseif magstate==2
    leftmag=('1.0 0.0 0.0\n');
    rightmag=('-1.0 0.0 0.0\n');
elseif magstate==3
    leftmag=('0.0 0.0 -1.0\n');
    rightmag=('0.0 0.0 1.0\n');
elseif magstate==4
    leftmag=('0.0 0.0 1.0\n');
    rightmag=('0.0 0.0 -1.0\n');
end

dwmag=('0.0 1.0 0.0\n');

cdfile=input('Please enter the file name for the current densities > ', 's');
cd=load(cdfile);

mdfile=input('Please enter the file name for the magnetic domains > ', 's');
md=load(mdfile);

xmax=sprintf('%e',str2double(xdim)*str2double(xcell));
xmax=strrep(xmax,'e-0','e-');

ymax=sprintf('%e',str2double(ydim)*str2double(ycell));
ymax=strrep(ymax,'e-0','e-');

zmax=sprintf('%e',str2double(zdim)*str2double(zcell));
zmax=strrep(zmax,'e-0','e-');

cdmod
mdmod