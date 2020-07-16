* Import semanticmap.csv and generate varibles for the three groups of documents in the two waves:

* Wave 1 (W1)
gen CourierW1=1 if v1<178
gen CourierW11 = CourierW1*v2
gen CourierW12 = CourierW1*v3
gen StopW1=1 if v1>177 & v1<2884
gen StopW11 = StopW1*v2
gen StopW12 = StopW1*v3
gen AdaniW1=1 if v1 >2883 & v1<3910
gen AdaniW11 = AdaniW1*v2
gen AdaniW12 = AdaniW1*v3
* Wave 2 (W2)
gen CourierW2=1 if v1>3909 & v1<3947
gen CourierW21 = CourierW2*v2
gen CourierW22 = CourierW2*v3
gen StopW2=1 if v1>3946 & v1<5021
gen StopW21 = StopW2*v2
gen StopW22 = StopW2*v3
gen AdaniW2=1 if v1 >5020
gen AdaniW21 = AdaniW2*v2
gen AdaniW22 = AdaniW2*v3

* For each group / wave keep only observations within one standard deviation from the average:

* Courier-Mail Wave 1:

egen cW11 = mean(CourierW11)
egen cW12 = mean(CourierW12)

gen radcW1 = ((CourierW12-cW12)^2 + (CourierW11-cW11)^2)^0.5
egen m = mean(radcW1)
drop if radcW1 > m    
keep CourierW11 CourierW22

* Repeat this process for each group / wave and merge the six files to obtain the final semantic map with 
* observations within one standard deviation ("final.dta")
