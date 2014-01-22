function [avgpid, time] = simStatesPID(stoptime, dt, runs, W, simName, cd)
run_seed = 1:runs;
for i = 1:runs
    r_seed = run_seed(i);
    s = RandStream.create('mt19937ar','seed',r_seed);
    RandStream.setDefaultStream(s);
    if cd == 0
        data(i)=sim('ltspidservo','ReturnWorkspaceOutputs', 'on');
    else if cd == 1
            data(i)=sim('ltspidservo_dis','ReturnWorkspaceOutputs', 'on');
        end
    end
    datamat{i}=(get(data(i),'dataout'))
    datatime{i}=(get(data(i),'tout'))
end

avgpid=mean(reshape(cell2mat(datamat), [ size(datamat{1}), length(datamat) ]), ndims(datamat{1})+1);
time = cell2mat(datatime);

end