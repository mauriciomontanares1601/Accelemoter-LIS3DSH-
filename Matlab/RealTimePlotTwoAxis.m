clear all;
clc;
close all;
delete(instrfindall);
x1=1;
x2=1;

while(1)
    
comport0 = serial('/dev/ttyUSB0','BaudRate',115200,'DataBits',8);
set(comport0,'Parity','none');
fopen(comport0);
axis([0 100 -2024 1024]);
    
    x1=x1+1;
    
    
    if(x1>100)
       f1=100;
    end 
    if(x1<101)
       f1=x1;
    end
    
    
    AxisX = fscanf(comport0,'%s');

    X = strfind(AxisX,'x','ForceCellOutput',false);  %%busca el caracter 'x' en el string
    
     
    FindAxisX = isempty(X);%boolean. True or Not
    
    figure(1);
        
    y1(f1)=fscanf(comport0,'%d');

    plot(y1,'b','linewidth',1);
    grid on;    
    hold on;
   
    fclose(comport0);
  
    drawnow;
    
    %y
    comport1 = serial('/dev/ttyUSB1','BaudRate',115200,'DataBits',8);
    set(comport1,'Parity','none')
    fopen(comport1);
    axis([0 100 -2024 1024]);
    
    
    
    x2=x2+1;
    
     
    if(x2>100)
       f2=100;
    end 
    if(x2<101)
       f2=x2;
    end
    
    
    AxisY = fscanf(comport1,'%s');
     
    %Y = strfind(AxisY,'y','ForceCellOutput',false);  %%busca el caracter 'y' en el string
    
   
    %FindAxisY = isempty(Y); %boolean. True or Not  
    
    figure(2);
    
    y2(f2)=fscanf(comport1,'%d');

    plot(y2,'r','linewidth',1);
    grid on;    
    hold on;
    
    fclose(comport1);
    
    drawnow;
    
    
   
    end

    
    if(x>=100)
       loop=0;
      while(loop<99)
          loop=loop+1;
          y1(loop)=y1(loop+1);
         y2(loop)=y2(loop+1);
       end

    end
%%%%%%
    
    fclose(comport0);
delete(comport0);   
fclose(comport1);
delete(comport1);

