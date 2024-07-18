# Define plasma model
define_plasma_model name=plasma bulk_model_type=global sheath_model_type=circuit


# Reaction set taken from table 2 and 9 from
# "Chemical reaction Mechanisms for Modeling the Fluorocarbon Plasma Etch of Silicon Oxide and Related Materials
# by Pauline Ho, Justine E. Johannes, Richard J. Buss, and Ellen Meeks

# Species - Table 9
add_species plasma_model=plasma name=CHF3  mass=70.013<amu> charge=0
add_species plasma_model=plasma name=CHF2+ mass=51.015<amu> charge=+1
add_species plasma_model=plasma name=CHF2  mass=51.015<amu> charge=0
add_species plasma_model=plasma name=CHF+  mass=32.017<amu> charge=+1
add_species plasma_model=plasma name=CHF   mass=32.017<amu> charge=0
add_species plasma_model=plasma name=CF3+  mass=69.005<amu> charge=+1
add_species plasma_model=plasma name=CF3   mass=69.005<amu> charge=0
add_species plasma_model=plasma name=CF2+  mass=50.007<amu> charge=+1
add_species plasma_model=plasma name=CF2   mass=50.007<amu> charge=0
add_species plasma_model=plasma name=CF+   mass=31.009<amu> charge=+1
add_species plasma_model=plasma name=CF    mass=31.009<amu> charge=0 
add_species plasma_model=plasma name=HF    mass=20.006<amu> charge=0
add_species plasma_model=plasma name=H2+   mass=2.0156<amu> charge=+1
add_species plasma_model=plasma name=H2    mass=2.0156<amu> charge=0
add_species plasma_model=plasma name=H+    mass=1.0078<amu> charge=+1
add_species plasma_model=plasma name=H     mass=1.0078<amu> charge=0
add_species plasma_model=plasma name=F+    mass=18.998<amu> charge=+1
add_species plasma_model=plasma name=F     mass=18.998<amu> charge=0
add_species plasma_model=plasma name=F-    mass=18.998<amu> charge=-1

# Bulk reactions - Table 2
add_bulk_reaction plasma_model=plasma name=2_11 \
    expression="e- + CF4 = CF4 + e-" \
    rate_coefficient_type=arrhenius \
    a=6.423e-7 b=-0.3186 c=3.999e3 energy_transfer=0.11<eV>

add_bulk_reaction plasma_model=plasma name=2_12 \
    expression="e- + CF4 = CF4 + e-" \
    rate_coefficient_type=arrhenius \
    a=9.844e-9 b=-0.2602 c=1.168e3 energy_transfer=0.05<eV>

add_bulk_reaction plasma_model=plasma name=2_13 \
    expression="e- + CF4 = CF4 + e-" \
    rate_coefficient_type=arrhenius \
    a=0.2 b=-1.367 c=7.734e4 energy_transfer=4.0<eV>

add_bulk_reaction plasma_model=plasma name=2_14 \
    expression="e- + CF4 = CF3 + F + e-" \
    rate_coefficient_type=arrhenius \
    a=1.190e-16 b=1.309 c=1.446e5 energy_transfer=5.6<eV>

add_bulk_reaction plasma_model=plasma name=2_15 \
    expression="e- + CF4 = CF2 + 2F + e-" \
    rate_coefficient_type=arrhenius \
    a=7.775e-17 b=1.184 c=1.663e5 energy_transfer=9.5<eV>

add_bulk_reaction plasma_model=plasma name=2_16 \
    expression="e- + CF4 = CF + 3F + e-" \
    rate_coefficient_type=arrhenius \
    a=1.039e-16 b=1.187 c=2.203e5 energy_transfer=14.9<eV>

add_bulk_reaction plasma_model=plasma name=2_17 \
    expression="e- + CF4 = CF3+ + F + 2e-" \
    rate_coefficient_type=arrhenius \
    a=1.159e-11 b=0.7645 c=1.993e5 energy_transfer=15.9<eV>

add_bulk_reaction plasma_model=plasma name=2_18 \
    expression="e- + CF4 = CF2+ + 2F + 2e-" \
    rate_coefficient_type=arrhenius \
    a=2.886e-11 b=0.5108 c=2.649e5 energy_transfer=22.0<eV>

add_bulk_reaction plasma_model=plasma name=2_19 \
    expression="e- + CF4 = CF+ + 3F + 2e-" \
    rate_coefficient_type=arrhenius \
    a=2.296e-14 b=1.090 c=3.132e5 energy_transfer=27.0<eV>

add_bulk_reaction plasma_model=plasma name=2_20 \
    expression="e- + CF4 = F+ + CF3 + 2e-" \
    rate_coefficient_type=arrhenius \
    a=1.482e-13 b=0.9375 c=4.023e5 energy_transfer=23.1<eV>

add_bulk_reaction plasma_model=plasma name=2_21 \
    expression="e- + CF4 = F+ + CF3+ + 3e-" \
    rate_coefficient_type=arrhenius \
    a=3.614e-17 b=1.413 c=3.966e5 energy_transfer=36.0<eV>

add_bulk_reaction plasma_model=plasma name=2_22 \
    expression="e- + CF4 = F+ + CF2+ + F + 3e-" \
    rate_coefficient_type=arrhenius \
    a=1.809e-22 b=2.431 c=3.912e5 energy_transfer=40.0<eV>

add_bulk_reaction plasma_model=plasma name=2_23 \
    expression="e- + CF4 = F+ + CF+ + 2F + 3e-" \
    rate_coefficient_type=arrhenius \
    a=4.867e-30 b=3.880 c=3.531e5 energy_transfer=42.0<eV>

add_bulk_reaction plasma_model=plasma name=2_24 \
    expression="e- + CF4 = CF3 + F-" \
    rate_coefficient_type=arrhenius \
    a=2.369e-8 b=-0.4893 c=5.876e4 energy_transfer=3.0<eV>

add_bulk_reaction plasma_model=plasma name=2_25 \
    expression="e- + CF3 = CF2 + F + e-" \
    rate_coefficient_type=arrhenius \
    a=4.163e-4 b=-0.9407 c=1.301e5 energy_transfer=3.8<eV>

add_bulk_reaction plasma_model=plasma name=2_26 \
    expression="e- + CF3 = CF3+ + 2e-" \
    rate_coefficient_type=arrhenius \
    a=1.4e-11 b=0.6481 c=1.133e5 energy_transfer=10.0<eV>

add_bulk_reaction plasma_model=plasma name=2_27 \
    expression="e- + CF3 = CF2+ + F + 2e-" \
    rate_coefficient_type=arrhenius \
    a=1.378e-10 b=0.4367 c=1.987e5 energy_transfer=17.1<eV>

add_bulk_reaction plasma_model=plasma name=2_28 \
    expression="e- + CF3 = CF+ + 2F + 2e-" \
    rate_coefficient_type=arrhenius \
    a=5.005e-11 b=0.5060 c=2.455e5 energy_transfer=21.4<eV>

# Bulk reactions - Table 9
add_bulk_reaction plasma_model=plasma name=9_1 \
    expression="e- + CHF3 = CHF3 + e-" \
    rate_coefficient_type=arrhenius \
    a=1.089e-2 b=-1.2214 c=2.645e4 energy_transfer=0.37<eV>

add_bulk_reaction plasma_model=plasma name=9_2 \
    expression="e- + CHF3 = CHF3 + e-" \
    rate_coefficient_type=arrhenius \
    a=3.019e-2 b=-1.3964 c=1.759e4 energy_transfer=0.18<eV>

add_bulk_reaction plasma_model=plasma name=9_3 \
    expression="e- + CHF3 = CHF3 + e-" \
    rate_coefficient_type=arrhenius \
    a=5.218e-2 b=-1.379 c=1.549e4 energy_transfer=0.13<eV>

add_bulk_reaction plasma_model=plasma name=9_4 \
    expression="e- + CHF3 = CHF3 + e-" \
    rate_coefficient_type=arrhenius \
    a=4.122e-2 b=-1.379 c=1.549e4 energy_transfer=10.9<eV>

add_bulk_reaction plasma_model=plasma name=9_5 \
    expression="e- + CHF3 = CHF3 + e-" \
    rate_coefficient_type=arrhenius \
    a=3.019e-2 b=-1.3964 c=1.759e4 energy_transfer=11.9<eV>

add_bulk_reaction plasma_model=plasma name=9_6 \
    expression="e- + CHF3 = CF3+ + H + 2e-" \
    rate_coefficient_type=arrhenius \
    a=5.361e-15 b=1.3438 c=1.736e5 energy_transfer=15.2<eV>

add_bulk_reaction plasma_model=plasma name=9_7 \
    expression="e- + CHF3 = CHF2+ + F + 2e-" \
    rate_coefficient_type=arrhenius \
    a=2.225e-15 b=-1.2886 c=1.906e5 energy_transfer=16.8<eV>

add_bulk_reaction plasma_model=plasma name=9_8 \
    expression="e- + CHF3 = CF2+ + HF + 2e-" \
    rate_coefficient_type=arrhenius \
    a=6.533e-17 b=-1.4404 c=1.800e5 energy_transfer=17.6<eV>

add_bulk_reaction plasma_model=plasma name=9_9 \
    expression="e- + CHF3 = CF+ + 2F + H + 2e-" \
    rate_coefficient_type=arrhenius \
    a=6.780e-16 b=1.5225 c=2.335e5 energy_transfer=20.9<eV>

add_bulk_reaction plasma_model=plasma name=9_10 \
    expression="e- + CHF3 = F+ + CHF2 + 2e-" \
    rate_coefficient_type=arrhenius \
    a=8.120e-14 b=0.9194 c=4.273e5 energy_transfer=37.0<eV>

add_bulk_reaction plasma_model=plasma name=9_11 \
    expression="e- + CHF3 = CHF+ + 2F + 2e-" \
    rate_coefficient_type=arrhenius \
    a=1.006e-15 b=1.3223 c=2.120e5 energy_transfer=19.8<eV>

add_bulk_reaction plasma_model=plasma name=9_12 \
    expression="e- + CHF3 = CF3 + H + e-" \
    rate_coefficient_type=arrhenius \
    a=3.963e-17 b=1.6416 c=1.044e5 energy_transfer=11.0<eV>

add_bulk_reaction plasma_model=plasma name=9_13 \
    expression="e- + CHF3 = CHF2 + F + e-" \
    rate_coefficient_type=arrhenius \
    a=1.187e-16 b=1.3167 c=1.376e5 energy_transfer=13.0<eV>

add_bulk_reaction plasma_model=plasma name=9_14 \
    expression="e- + CHF3 = CF2 + HF + e-" \
    rate_coefficient_type=arrhenius \
    a=3.626e-14 b=1.0759 c=2.631e5 energy_transfer=23.6<eV>

add_bulk_reaction plasma_model=plasma name=9_15 \
    expression="e- + CHF3 = CHF + 2F + e-" \
    rate_coefficient_type=arrhenius \
    a=8.084e-13 b=0.5725 c=4.070e5 energy_transfer=35.0<eV>

add_bulk_reaction plasma_model=plasma name=9_16 \
    expression="e- + CHF3 = CF + H + 2F + e-" \
    rate_coefficient_type=arrhenius \
    a=6.752e-9 b=0.1877 c=2.358e5 energy_transfer=13.3<eV>

add_bulk_reaction plasma_model=plasma name=9_17 \
    expression="e- + CHF3 = CF3 + H + e-" \
    rate_coefficient_type=arrhenius \
    a=2.555e-6 b=-0.4365 c=1.546e5 energy_transfer=11.0<eV>

add_bulk_reaction plasma_model=plasma name=9_18 \
    expression="e- + CHF3 = F- + CHF2" \
    rate_coefficient_type=arrhenius \
    a=8.988e-5 b=-1.3618 c=1.129e5 energy_transfer=1.3<eV>

add_bulk_reaction plasma_model=plasma name=9_19 \
    expression="e- + CHF3 = F- + CHF2" \
    rate_coefficient_type=arrhenius \
    a=1.166e-6 b=-1.2306 c=4.219e4 energy_transfer=1.3<eV>

add_bulk_reaction plasma_model=plasma name=9_20 \
    expression="e- + CHF2 = CF2+ + H + 2e-" \
    rate_coefficient_type=arrhenius \
    a=5.361e-15 b=1.3438 c=1.736e5 energy_transfer=17.2<eV>

add_bulk_reaction plasma_model=plasma name=9_21 \
    expression="e- + CHF2 = CHF+ + F + 2e-" \
    rate_coefficient_type=arrhenius \
    a=2.225e-15 b=1.2886 c=1.906e5 energy_transfer=14.3<eV>

add_bulk_reaction plasma_model=plasma name=9_22 \
    expression="e- + CHF2 = CF+ + HF + 2e-" \
    rate_coefficient_type=arrhenius \
    a=6.533e-17 b=1.4404 c=1.800e5 energy_transfer=14.6<eV>

add_bulk_reaction plasma_model=plasma name=9_23 \
    expression="e- + CHF2 = CF2 + H + e-" \
    rate_coefficient_type=arrhenius \
    a=3.963e-17 b=1.6416 c=1.044e5 energy_transfer=2.71<eV>

add_bulk_reaction plasma_model=plasma name=9_24 \
    expression="e- + CHF2 = CHF + F + e-" \
    rate_coefficient_type=arrhenius \
    a=1.187e-16 b=1.3167 c=1.376e5 energy_transfer=4.75<eV>

add_bulk_reaction plasma_model=plasma name=9_25 \
    expression="e- + CHF2 = CF + H + F + e-" \
    rate_coefficient_type=arrhenius \
    a=3.626e-14 b=1.0759 c=2.631e5 energy_transfer=8.09<eV>

add_bulk_reaction plasma_model=plasma name=9_26 \
    expression="e- + H2 = H2 + e-" \
    rate_coefficient_type=arrhenius \
    a=1.400e-5 b=-0.7604 c=2.264e4 energy_transfer=0.5<eV>

add_bulk_reaction plasma_model=plasma name=9_27 \
    expression="e- + H2 = H2 + e-" \
    rate_coefficient_type=arrhenius \
    a=4.185e-12 b=0.6434 c=1.407e5 energy_transfer=11.37<eV>

add_bulk_reaction plasma_model=plasma name=9_28 \
    expression="e- + H2 = H2 + e-" \
    rate_coefficient_type=arrhenius \
    a=6.250e-13 b=0.8498 c=1.702e5 energy_transfer=11.70<eV>

add_bulk_reaction plasma_model=plasma name=9_29 \
    expression="e- + H2 = 2H + e-" \
    rate_coefficient_type=arrhenius \
    a=1.697e-8 b=-0.0244 c=1.199e5 energy_transfer=4.4<eV>

add_bulk_reaction plasma_model=plasma name=9_30 \
    expression="e- + H2 = H2+ + 2e-" \
    rate_coefficient_type=arrhenius \
    a=1.329e-13 b=1.075 c=1.976e5 energy_transfer=15.4<eV>

add_bulk_reaction plasma_model=plasma name=9_31 \
    expression="e- + H = H + e-" \
    rate_coefficient_type=arrhenius \
    a=8.367e-10 b=0.3014 c=1.335e5 energy_transfer=10.2<eV>

add_bulk_reaction plasma_model=plasma name=9_32 \
    expression="e- + H = H+ + 2e-" \
    rate_coefficient_type=arrhenius \
    a=7.332e-12 b=0.6938 c=1.694e5 energy_transfer=13.6<eV>

add_bulk_reaction plasma_model=plasma name=9_33 \
    expression="F- + CHF2+ = F + CF2 + H" \
    rate_coefficient_type=arrhenius \
    a=4.0e-7 b=-0.5 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=9_34 \
    expression="F- + CHF+ = F + CF + H" \
    rate_coefficient_type=arrhenius \
    a=4.0e-7 b=-0.5 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=9_35 \
    expression="F- + H2+ = F + 2H" \
    rate_coefficient_type=arrhenius \
    a=4.0e-7 b=-0.5 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=9_36 \
    expression="e- + H2+ = 2H" \
    rate_coefficient_type=arrhenius \
    a=4.0e-8 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=9_37 \
    expression="e- + CHF2+ = H + CF2" \
    rate_coefficient_type=arrhenius \
    a=4.0e-8 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=9_38 \
    expression="e- + CHF+ = H + CF" \
    rate_coefficient_type=arrhenius \
    a=4.0e-8 b=0 c=0 energy_transfer=0<eV>