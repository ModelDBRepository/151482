cd('C:\Users\lb5962\SPN_ModelDB')
N=importdata('ActivationProtocol_GKA.dat',' ',1);

cd('C:\Users\lb5962\SPN_ModelDB')
M=importdata('InactivationProtocol_GKA.dat',' ',1);

%% Normalised conductances

[m,n]=size(N.data);

dt=M.data(2,1)-M.data(1,1);

for i=2:n
    Act(i-1)=max(N.data(3e3/dt:3.5e3/dt,i));
end

Act=Act/max(Act);
V_Act=fliplr([-100:5:0]);

[k,l]=size(M.data);

for i=2:l
    Inact(i-1)=max(M.data(3e3/dt:3.5e3/dt,i));
end

Inact=Inact/max(Inact);
V_Inact=fliplr([-100:5:-20]);

h=figure;
plot(V_Act,Act,'-sg')
hold on
plot(V_Inact,Inact,'-ok')
xlabel('Conditioning Potential V_C (mV)')
ylabel('Normalised Peak Conductance')

hold off