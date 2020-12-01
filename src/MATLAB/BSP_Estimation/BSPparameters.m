%% BSPparameters for each segment
% Gets the mass, intertia matrix and COM of each segment
% Returns them in the objects

% P should be in same units as the density!
function [Body]= BSPparameters(P)

  %% Assuming constant density along the whole body
  p= 1000.0; % kg/m3 (from google)

  %% Hand segment (SE)
  Hand.a=P(14)/(2*pi);
  Hand.b=Hand.a;
  Hand.c=P(2)/2;
  Hand.p=p; % Density of hand?
  [Hand.Mass, Hand.COMpos, Hand.Inertia]=semiellipsoid(Hand.p,Hand.a,Hand.b,Hand.c);
  Hand.COMpos=[-Hand.COMpos, 0,0];
  
  %% Forearm (ES)
  Forearm.a0=P(17)/(2*pi);
  Forearm.b0=Forearm.a0;
  Forearm.a1=P(15)/(2*pi);
  Forearm.b1=Forearm.a1;
  Forearm.L=P(3);
  Forearm.p=p; % Density of forearm?
  [Forearm.Mass, Forearm.COMpos, Forearm.Inertia] = ellipticalsolid(Forearm.p,Forearm.L,Forearm.a0,Forearm.b0,Forearm.b0,Forearm.b0,Forearm.a1,Forearm.b1,Forearm.b1,Forearm.b1);
  Forearm.COMpos=[-Forearm.COMpos, 0,0];
  
  %% Upperarm (ES)
  Upperarm.a0=P(18)/(2*pi);
  Upperarm.b0=Upperarm.a0;
  Upperarm.a1=P(17)/(2*pi);
  Upperarm.b1=Upperarm.a1;
  Upperarm.L=P(5);
  Upperarm.p=p; % Density of upperarm?
  [Upperarm.Mass, Upperarm.COMpos, Upperarm.Inertia] = ellipticalsolid(Upperarm.p,Upperarm.L,Upperarm.a0,Upperarm.b0,Upperarm.b0,Upperarm.b0,Upperarm.a1,Upperarm.b1,Upperarm.b1,Upperarm.b1);
  Upperarm.COMpos=[-Upperarm.COMpos, 0,0];

  %% Foot (ES)
  Foot.a0=P(19)/(2*pi);
  Foot.b0=Foot.a0;
  Foot.a1=(P(33)+P(34))/4;
  Foot.b1=(P(20)+P(21))/4;
  Foot.L=P(6);
  Foot.p=p; % Density of foot?
  [Foot.Mass, Foot.COMpos, Foot.Inertia] = ellipticalsolid(Foot.p,Foot.L,Foot.a0,Foot.b0,Foot.b0,Foot.b0,Foot.a1,Foot.b1,Foot.b1,Foot.b1);
  Foot.COMpos=[0 Foot.COMpos 0];
  
  %% Shank (ES)
  Shank.a0=P(24)/(2*pi);
  Shank.b0=Shank.a0;
  Shank.a1=P(22)/(2*pi);
  Shank.b1=Shank.a1;
  Shank.L=P(7);
  Shank.p=p; % Density of shank?
  [Shank.Mass, Shank.COMpos, Shank.Inertia] = ellipticalsolid(Shank.p,Shank.L,Shank.a0,Shank.b0,Shank.b0,Shank.b0,Shank.a1,Shank.b1,Shank.b1,Shank.b1);
  Shank.COMpos=[0,0,Shank.COMpos];

  %% Thigh (ES)
  Thigh.b0=P(35)/2;
  Thigh.a0=P(25)/pi-Thigh.b0;
  Thigh.a1=P(24)/(2*pi);
  Thigh.b1=Thigh.a1;
  Thigh.L=P(8);
  Thigh.p=p; % Density of the thigh?
  [Thigh.Mass, Thigh.COMpos, Thigh.Inertia] = ellipticalsolid(Thigh.p,Thigh.L,Thigh.a0,Thigh.b0,Thigh.b0,Thigh.b0,Thigh.a1,Thigh.b1,Thigh.b1,Thigh.b1);
  Thigh.COMpos=[0,0,Thigh.COMpos];

  %% Head (SE)
  Head.a=P(26)/(2*pi);
  Head.b=Head.a;
  Head.c=P(9)/2;
  Head.p=p; % Density of Head?
  [Head.Mass, Head.COMpos, Head.Inertia]=semiellipsoid(Head.p,Head.a,Head.b,Head.c);
  Head.COMpos=[0, 0, -Head.COMpos];
  
  %% Uppertrunk (ES)
  Uppertrunk.a0=(P(36)+P(37))/4;
  Uppertrunk.b0=Uppertrunk.a0;
  Uppertrunk.a1=Uppertrunk.a0;
  Uppertrunk.b1=Uppertrunk.a1;
  Uppertrunk.L=P(7);
  Uppertrunk.p=p; % Density of the uppertrunk?
  [Uppertrunk.Mass, Uppertrunk.COMpos, Uppertrunk.Inertia] = ellipticalsolid(Uppertrunk.p,Uppertrunk.L,Uppertrunk.a0,Uppertrunk.b0,Uppertrunk.b0,Uppertrunk.b0,Uppertrunk.a1,Uppertrunk.b1,Uppertrunk.b1,Uppertrunk.b1);
  Uppertrunk.COMpos=[0, 0, -Uppertrunk.COMpos];

  %% Middletrunk (ES)
  Middletrunk.a0 = P(37)/2;
  Middletrunk.a1 = P(38)/2;
  Middletrunk.L = P(12);
  Middletrunk.b0 = (P(28)/pi)- Middletrunk.a0;
  Middletrunk.b1 = (P(29)/pi)- Middletrunk.a1;
  Middletrunk.p=p; % Density of the middletrunk?
  [Middletrunk.Mass, Middletrunk.COMpos, Middletrunk.Inertia] = ellipticalsolid(Middletrunk.p,Middletrunk.L,Middletrunk.a0,Middletrunk.b0,Middletrunk.b0,Middletrunk.b0,Middletrunk.a1,Middletrunk.b1,Middletrunk.b1,Middletrunk.b1);
  Middletrunk.COMpos=[0, 0, -Middletrunk.COMpos];

  %% Lowertrunk (ES)
  Lowertrunk.a0 = (P(38)+P(39))/4;
  Lowertrunk.a1 = Lowertrunk.a0;
  Lowertrunk.L = P(13);
  Lowertrunk.b0 = ((P(29)+P(30))/(2*pi)) - Lowertrunk.a0; 
  Lowertrunk.b1 = Lowertrunk.b0; 
  Lowertrunk.p=p; % Density of the lowertrunk?
  [Lowertrunk.Mass, Lowertrunk.COMpos, Lowertrunk.Inertia] = ellipticalsolid(Lowertrunk.p,Lowertrunk.L,Lowertrunk.a0,Lowertrunk.b0,Lowertrunk.b0,Lowertrunk.b0,Lowertrunk.a1,Lowertrunk.b1,Lowertrunk.b1,Lowertrunk.b1);  
  Lowertrunk.COMpos=[0, 0, -Lowertrunk.COMpos];
  
  %% Wholetrunk
  Wholetrunk.Mass=Lowertrunk.Mass+Middletrunk.Mass+Uppertrunk.Mass;
  
  %% Total mass
  Totalmass=(2*Hand.Mass+2*Forearm.Mass+2*Upperarm.Mass+2*Foot.Mass+2*Shank.Mass+2*Thigh.Mass+Head.Mass+Uppertrunk.Mass+Middletrunk.Mass+Lowertrunk.Mass);
  
  %% Assembly body structure
  Body.handL=Hand;
  Body.forearmL=Forearm;
  Body.upperarmL=Upperarm;
  Body.footL=Foot;
  Body.shankL=Shank;
  Body.thighL=Thigh;
  Body.handR=Hand;
  Body.forearmR=Forearm;
  Body.upperarmR=Upperarm;
  Body.footR=Foot;
  Body.shankR=Shank;
  Body.thighR=Thigh;
  Body.head=Head;
  Body.uppertrunk=Uppertrunk;
  Body.middletrunk=Middletrunk;
  Body.lowertrunk=Lowertrunk;
  Body.wholetrunk=Wholetrunk;
  Body.totalmass=Totalmass;
  
end
