function sol=fitnesss(sol,data)

%% Calling Data
load data
%% Calling Sol
x=sol.x;
CH=0;
%% Random Key
[~,chrom]=sort(x);
x0=chrom;
%% 
T0=0;
T1=0;
T2=0;
    while 1
        
        T0=T0+extP0(chrom(1));
        chrom(1)=[];
        if isempty(chrom)
            break;
        end
        T1=T1+extP1(chrom(1));
        chrom(1)=[];
        if isempty(chrom)
            break;
        end
        T2=T2+extP2(chrom(1));
        chrom(1)=[];
        if isempty(chrom)
            break;
        end
    end
    makespan=max([T0,T1,T2]);
    if ~feasible(chrom,DAG)
        CH=100;
    end


%% Cal CH
SCH=1000*sum(CH);

%% Cal OBJ

fit0=makespan;



sol.fit=fit0+(1*SCH);
sol.info.x=x0;
sol.SCH=SCH;
sol.info.SCH=SCH;
sol.info.CH=CH;
sol.info.fit0=fit0;
sol.info.fit=sol.fit;



end

function tf=feasible(chrom,DAG)
    tf=true;
    sign=1;
    for i=2:length(chrom)
        links=find(DAG(:,chrom(i))~=0);
        if numel(links)>i
            tf=false;
            break;
        else
            for j=1:numel(links)
                idx=find(links(j)==chrom(1:i));
                if isempty(idx)
                    tf=false;
                    sign=0;
                    break;
                end
            end
            if sign==0
                break
            end
        end
    end
end


% in mahsol motalegh be matlabhome.ir ast foroshe an dar saiere sitha gheire ghanoni ast
% va peigard ghanoni darad dar sorate moshahede lotfan be ma etela dahid
% htps://matlabhome.ir/
% @matlabhome_admin
% htps://t.me/matlabhome
% 09190090258



