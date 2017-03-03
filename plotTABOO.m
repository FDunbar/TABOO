%function (A,B) = 'Plot Output'

% This function takes input from the numbers of observation points for the 
% TABOO input and corresponds the observation point with the calculations 
% on the output files 'rate.his' and 'disp.his'
%B = load 'obspoints.txt';
%num_obs = length(B); 
num_obs = 11;
                
                fid = fopen('rate.his') ;
                    if fid == -1
                        disp ('File open not working')
                    else
                        disp('File open worked!')

                S = textscan(fid,'%s','delimiter','\n') ; %scans text
                S = S{1} ;
                %get locations where # not present
                qwe= strfind(S, '#');  %locates string '#'
                qwe = find((cellfun('isempty',qwe)));  
                %create new array sans '#'
                qwer = cell2mat(cellfun(@str2num,S(qwe),'un',0)) ; 
                qwerl = length(qwer);


                closeresult = fclose(fid);

                    if closeresult == 0
                        disp('File Close worked')
                    else
                        disp('File Close failure')


                    end
                    end
for  n= 1:num_obs - 1 
    
    zxa = n + (n-1)*10;     %functions which give the  column interval on the above
    %matrice which correspond to each time stamp on the observation point
    zxb = n + (n-1)*10 + 10;
    
    rate(n).time   = qwer(zxa:zxb,1)
    rate(n).drad   = qwer(zxa:zxb,2)
    rate(n).dcol   = qwer(zxa:zxb,3)
    rate(n).dlon   = qwer(zxa:zxb,4)
    rate(n).dgeoid = qwer(zxa:zxb,5)
    rate(n).mass   = qwer(zxa:zxb,6)
    
end
