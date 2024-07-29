# Gas-phase reactions in CHF3 plasma in addition
# to the reactions specified in cf4.tcl
# Source: 
# P. Ho et al. "Chemical reaction Mechanisms for 
#               Modeling the Fluorocarbon Plasma 
#               Etch of Silicon Oxide and Related Materials"

# TABLE 9 - Additional CHF3 Reactions
add_bulk_reaction plasma_model=plasma name=9a_6 \
    expression="e- + CHF3 = CF3+ + H + 2e-" \
    rate_coefficient_type=arrhenius \
    a=5.361e-21 b=1.4404 c=15.5106 energy_transfer=15.2<eV>

add_bulk_reaction plasma_model=plasma name=9a_7 \
    expression="e- + CHF3 = CHF2+ + F + 2e-" \
    rate_coefficient_type=arrhenius \
    a=2.225e-21 b=1.2886 c=16.424 energy_transfer=16.8<eV>

add_bulk_reaction plasma_model=plasma name=9a_8 \
    expression="e- + CHF3 = CF2+ + HF + 2e-" \
    rate_coefficient_type=arrhenius \
    a=6.533e-23 b=1.4404 c=15.5106 energy_transfer=17.6<eV>

add_bulk_reaction plasma_model=plasma name=9a_9 \
    expression="e- + CHF3 = CF+ + 2F + H + 2e-" \
    rate_coefficient_type=arrhenius \
    a=6.780e-22 b=1.5225 c=20.1207 energy_transfer=20.9<eV>

add_bulk_reaction plasma_model=plasma name=9a_10 \
    expression="e- + CHF3 = F+ + CHF2 + 2e-" \
    rate_coefficient_type=arrhenius \
    a=8.120e-20 b=0.9194 c=36.8204 energy_transfer=37.0<eV>

add_bulk_reaction plasma_model=plasma name=9a_11 \
    expression="e- + CHF3 = CHF+ + 2F + 2e-" \
    rate_coefficient_type=arrhenius \
    a=1.006e-21 b=1.3223 c=18.2680 energy_transfer=19.8<eV>

add_bulk_reaction plasma_model=plasma name=9a_12 \
    expression="e- + CHF3 = CF3 + H + e-" \
    rate_coefficient_type=arrhenius \
    a=3.963e-23 b=1.6416 c=8.9961 energy_transfer=11.0<eV>

add_bulk_reaction plasma_model=plasma name=9a_13 \
    expression="e- + CHF3 = CHF2 + F + e-" \
    rate_coefficient_type=arrhenius \
    a=1.187e-22 b=1.3167 c=11.8570 energy_transfer=13.0<eV>

add_bulk_reaction plasma_model=plasma name=9a_14 \
    expression="e- + CHF3 = CF2 + HF + e-" \
    rate_coefficient_type=arrhenius \
    a=3.626e-20 b=1.0759 c=22.6713 energy_transfer=23.6<eV>

add_bulk_reaction plasma_model=plasma name=9a_15 \
    expression="e- + CHF3 = CHF + 2F + 2e-" \
    rate_coefficient_type=arrhenius \
    a=8.084e-19 b=0.5725 c=35.0712 energy_transfer=35.0<eV>

add_bulk_reaction plasma_model=plasma name=9a_16 \
    expression="e- + CHF3 = CF + H + 2F + e-" \
    rate_coefficient_type=arrhenius \
    a=6.752e-15 b=0.1877 c=20.3189 energy_transfer=13.3<eV>

add_bulk_reaction plasma_model=plasma name=9a_18_19 \
    expression="e- + CHF3 = F- + CHF2" \
    rate_coefficient_type=arrhenius \
    a=9.1046e-11 b=-1.3618 c=9.7286 energy_transfer=1.3<eV>

add_bulk_reaction plasma_model=plasma name=9a_20 \
    expression="e- + CHF2 = CF2+ + H + 2e-" \
    rate_coefficient_type=arrhenius \
    a=5.361e-21 b=1.3438 c=14.9591 energy_transfer=17.2<eV>

add_bulk_reaction plasma_model=plasma name=9a_21 \
    expression="e- + CHF2 = CHF+ + F + 2e-" \
    rate_coefficient_type=arrhenius \
    a=2.225e-21 b=1.2886 c=16.4240 energy_transfer=14.3<eV>

add_bulk_reaction plasma_model=plasma name=9a_22 \
    expression="e- + CHF2 = CF+ + HF + 2e-" \
    rate_coefficient_type=arrhenius \
    a=6.533e-23 b=1.4404 c=15.5106 energy_transfer=14.6<eV>

add_bulk_reaction plasma_model=plasma name=9a_23 \
    expression="e- + CHF2 = CF2 + H + e-" \
    rate_coefficient_type=arrhenius \
    a=3.963e-23 b=1.6416 c=8.9961 energy_transfer=2.71<eV>

add_bulk_reaction plasma_model=plasma name=9a_24 \
    expression="e- + CHF2 = CHF + F + e-" \
    rate_coefficient_type=arrhenius \
    a=1.187e-22 b=1.3167 c=11.8570 energy_transfer=4.75<eV>

add_bulk_reaction plasma_model=plasma name=9a_25 \
    expression="e- + CHF2 = CF + H + F + e-" \
    rate_coefficient_type=arrhenius \
    a=3.626e-14 b=1.0759 c=22.6713 energy_transfer=8.09<eV>

add_bulk_reaction plasma_model=plasma name=9a_29 \
    expression="e- + H2 = 2H + e-" \
    rate_coefficient_type=arrhenius \
    a=1.697e-14 b=-0.0244 c=10.3318 energy_transfer=4.4<eV>

add_bulk_reaction plasma_model=plasma name=9a_30 \
    expression="e- + H2 = H2+ + 2e-" \
    rate_coefficient_type=arrhenius \
    a=1.329e-19 b=1.075 c=17.0272 energy_transfer=15.4<eV>

add_bulk_reaction plasma_model=plasma name=9a_32 \
    expression="e- + H = H+ + 2e-" \
    rate_coefficient_type=arrhenius \
    a=7.332e-18 b=0.6938 c=14.5972 energy_transfer=13.6<eV>

add_bulk_reaction plasma_model=plasma name=9a_33 \
    expression="F- + CHF2+ = F + CF2 + H" \
    rate_coefficient_type=arrhenius \
    a=4e-13 b=-0.5 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=9a_34 \
    expression="F- + CHF+ = F + CF + H" \
    rate_coefficient_type=arrhenius \
    a=4e-13 b=-0.5 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=9a_35 \
    expression="F- + H2+ = F + 2H" \
    rate_coefficient_type=arrhenius \
    a=4e-13 b=-0.5 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=9a_36 \
    expression="e- + H2+ = 2H" \
    rate_coefficient_type=arrhenius \
    a=4e-14 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=9a_37 \
    expression="e- + CHF2+ = H + CF2" \
    rate_coefficient_type=arrhenius \
    a=4e-14 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=9a_38 \
    expression="e- + CHF+ = H + CF" \
    rate_coefficient_type=arrhenius \
    a=4e-14 b=0 c=0 energy_transfer=0<eV>