%% Data Import
Population = readmatrix('ACS 2020 Table 01 Population.csv');
Race = readmatrix('ACS 2020 Table 01 Race.csv');
Education = readmatrix('ACS 2020 Table 08 Education.csv');
HH_Income = readmatrix('ACS 2020 Table 10 HH Income.csv');
HH_Poverty = readmatrix('ACS 2020 Table 10 HH Poverty.csv');
Health_Ins = readmatrix('ACS 2020 Table 22 Health Insurance.csv');
Health_Outcome = readmatrix('CDC Places 2020 Health Outcomes.csv');
Hospital_Compare = readmatrix('Hospital Compare 2020.csv');

%% Data for 785 & 793 zip3
% zip3 785 Rio Grande Valley, TX
Education_785 = Education(27252:27309,:);
Population_785 = Population(27252:27309,:);
Race_785 = Race(27252:27309,:);
HH_Income_785 = HH_Income(27252:27309,:);
HH_Poverty_785 = HH_Poverty(27252:27309,:);
Health_Ins_785 = Health_Ins(27252:27309,:);

% zip3 794 Lubbock, TX
HH_Income_794 = HH_Income(27633:27646,:);

%% Race Plots for zip3 785 Rio Grande Valley (Hidalgo County)
Pop_Total = Population_785(:,2); %Total Population zip3 785
Pop_White = Population_785(:,4); %White Population zip3 785
Pop_NotWhite = Pop_Total - Pop_White; %Nonwhite Population zip3 785
Pop = sortrows([Pop_Total,Pop_NotWhite]);
hold on;
xlabel('Total Population');
ylabel('Non-White Population');
title('Non-White Population vs. Total Population');
plot(Pop(:,1),Pop(:,2));
% linear regression of above plot gives % of nonwhite population

%% Household Income less than $34,999
HHPop_Total_785 = sum(HH_Income_785(:,2)); %Total Population of HH income for zip3 785
LowIncome_785 = sum(sum(HH_Income_785(:,3:8))); %Population of HH income for zip3 785 under $34,999 yearly
LowIncomePercent_785 = LowIncome_785/HHPop_Total_785; %Low income population zip3 785 under $34,999 yearly

HHPop_Total_794 = sum(HH_Income_794(:,2)); %Total Population of HH income for zip3 794
LowIncome_794 = sum(sum(HH_Income_794(:,3:8))); %Population of HH income for zip3 794 under $34,999 yearly
LowIncomePercent_794 = LowIncome_794/HHPop_Total_794; %Low income population zip3 794 under $34,999 yearly

%% Household Income less than $29,999

HHPop_Total_785_30k = sum(HH_Income_785(:,2)); %Total Population of HH income for zip3 785
LowIncome_785_30k = sum(sum(HH_Income_785(:,3:7))); %Population of HH income for zip3 785 under $29,999 yearly
LowIncomePercent_785_30k = LowIncome_785_30k/HHPop_Total_785_30k; %Low income population zip3 785 under $29,999 yearly

HHPop_Total_794_30k = sum(HH_Income_794(:,2)); %Total Population of HH income for zip3 794
LowIncome_794_30k = sum(sum(HH_Income_794(:,3:7))); %Population of HH income for zip3 794 under $29,999 yearly
LowIncomePercent_794_30k = LowIncome_794_30k/HHPop_Total_794_30k; %Low income population zip3 794 under $29,999 yearly

%% Household Size for zip3 785
HH_Size_785 = sum(Pop_Total)/HHPop_Total_785;

%% Lowest income zip3 in 785 sorted by ZCTA
LowIncome_785_zip = sortrows(HH_Income_785);

%% Health Data - Number of diagnosed people with diabetes and obesity per 1000 people
Health = sortrows(Health_Outcome(:,[1,24,30])); % zcta5, diabetes per 1000, obesity per 1000

% McCallen 78501-78504
Diab_78501 = Health(26656,2);
Obes_78501 = Health(26656,3);
% Donna 78537
Diab_78537 = Health(26665,2);
Obes_78537 = Health(26665,3);
% Edinburg 78539-78542
Diab_78539 = sum(Health(26667:26669,2))/3;
Obes_78539 = sum(Health(26667:26669,3))/3;
% Mission 78572-78574
Diab_78572 = sum(Health(26689:26691,2))/3;
Obes_78572 = sum(Health(26689:26691,3))/3;
% Pharr 78577
Diab_78577 = Health(26693,2);
Obes_78577 = Health(26693,3);
% San Juan 78589
Diab_78589 = Health(26703,2);
Obes_78589 = Health(26703,3);
% Weslaco 78596
Diab_78596 = Health(26711,2);
Obes_78596 = Health(26711,3);
% Average for zip3 785
DiabAvg_785 = sum([Diab_78501, Diab_78537, Diab_78539, Diab_78572, Diab_78577, Diab_78589, Diab_78596])/7;
ObesAvg_785 = sum([Obes_78501, Obes_78537, Obes_78539, Obes_78572, Obes_78577, Obes_78589, Obes_78596,])/7;

% Lubbock 79401-79424 (Average for zip3 794)
DiabAvg_794 = sum(Health(27021:27032,2))/12;
ObesAvg_794 = sum(Health(27021:27032,3))/12;

% Amarillo 791XX (Average for zip3 791)
DiabAvg_791 = sum(Health(26936:26949,2))/14;
ObesAvg_791 = sum(Health(26936:26949,3))/14;

% Abilene 796XX (Average for zip3 796)
DiabAvg_796 = sum(Health(27075:27081,2))/7;
ObesAvg_796 = sum(Health(27075:27081,3))/7;

% Average for Midland 79701-79707
DiabAvg_797 = sum(Health(27082:27086,2))/5;
ObesAvg_797 = sum(Health(27082:27086,3))/5;

% Average for Ft Worth (Tarrant County) 761XX
DiabAvg_761 = sum(Health(25751:25790,2))/40;
ObesAvg_761 = sum(Health(25751:25790,3))/40;

% Average for Waco (McLennan County) 767XX
DiabAvg_767 = sum(Health(26005:26015,2))/11;
ObesAvg_767 = sum(Health(26005:26015,3))/11;

%% Final Data
disp('Percent of Households with an income of less than $35,000 in Rio Grande Valley:');
disp(LowIncomePercent_785);
disp('Percent of Households with an income of less than $35,000 in Lubbock:');
disp(LowIncomePercent_794);
disp('Percent of Households with an income of less than $30,000 in Rio Grande Valley:');
disp(LowIncomePercent_785_30k);
disp('Percent of Households with an income of less than $30,000 in Lubbock:');
disp(LowIncomePercent_794_30k);

disp('Number of People per 1000 diagnosed with Diabetes according to ACS 2020:');
disp('Rio Grande Valley (Hidalgo Co.)');
disp(DiabAvg_785);
disp('Lubbock');
disp(DiabAvg_794);
disp('Amarillo');
disp(DiabAvg_791);
disp('Abilene');
disp(DiabAvg_796);
disp('Midland');
disp(DiabAvg_797);
disp('Ft Worth');
disp(DiabAvg_761);
disp('Waco');
disp(DiabAvg_767);

disp('Number of People per 1000 diagnosed with Obesity according to ACS 2020:');
disp('Rio Grande Valley (Hidalgo Co.)');
disp(ObesAvg_785);
disp('Lubbock');
disp(ObesAvg_794);
disp('Amarillo');
disp(ObesAvg_791);
disp('Abilene');
disp(ObesAvg_796);
disp('Midland');
disp(ObesAvg_797);
disp('Ft Worth');
disp(ObesAvg_761);
disp('Waco');
disp(ObesAvg_767);