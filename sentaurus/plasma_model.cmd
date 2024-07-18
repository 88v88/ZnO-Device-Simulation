# Define plasma model
define_plasma_model name=plasma bulk_model_type=global sheath_model_type=circuit


# Reaction set taken from table 2 and 9 from
# "Chemical reaction Mechanisms for Modeling the Fluorocarbon Plasma Etch of Silicon Oxide and Related Materials
# by Pauline Ho, Justine E. Johannes, Richard J. Buss, and Ellen Meeks

# Additional Species - Table 2
add_species plasma_model=plasma name=CF4    mass=88.003<amu>  charge=0
add_species plasma_model=plasma name=SiF4   mass=104.078<amu> charge=0
add_species plasma_model=plasma name=SiF3+  mass=85.080<amu>  charge=+1
add_species plasma_model=plasma name=SiF3   mass=85.080<amu>  charge=0
add_species plasma_model=plasma name=SiF2+  mass=66.082<amu>  charge=+1
add_species plasma_model=plasma name=SiF2   mass=66.082<amu>  charge=0
add_species plasma_model=plasma name=SiF+   mass=47.084<amu>  charge=+1
add_species plasma_model=plasma name=SiF    mass=47.084<amu>  charge=0
add_species plasma_model=plasma name=CO+    mass=28.010<amu>  charge=+1
add_species plasma_model=plasma name=CO     mass=28.010<amu>  charge=0
add_species plasma_model=plasma name=Si+    mass=28.086<amu>  charge=+1
add_species plasma_model=plasma name=Si     mass=28.086<amu>  charge=0
add_species plasma_model=plasma name=O2+    mass=31.998<amu>  charge=+1
add_species plasma_model=plasma name=O2     mass=31.998<amu>  charge=0
add_species plasma_model=plasma name=O+     mass=15.999<amu>  charge=+1
add_species plasma_model=plasma name=O      mass=15.999<amu>  charge=0

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

add_bulk_reaction plasma_model=plasma name=2_29 \
    expression="e- + CF3 = F+ + CF2 + 2e-" \
    rate_coefficient_type=arrhenius \
    a=5.581e-10 b=0.2896 c=3.336e5 energy_transfer=21.3<eV>

add_bulk_reaction plasma_model=plasma name=2_30 \
    expression="e- + CF3 = CF2 + F-" \
    rate_coefficient_type=arrhenius \
    a=2.369e-8 b=-0.4893 c=5.876e4 energy_transfer=0.40<eV>

add_bulk_reaction plasma_model=plasma name=2_31 \
    expression="e- + CF2 = CF2 + e-" \
    rate_coefficient_type=arrhenius \
    a=3.419e-4 b=-0.8606 c=9.01e4 energy_transfer=5.6<eV>

add_bulk_reaction plasma_model=plasma name=2_32 \
    expression="e- + CF2 = CF2 + e-" \
    rate_coefficient_type=arrhenius \
    a=1.795e-4 b=-0.838 c=4.225e4 energy_transfer=2.2<eV>

add_bulk_reaction plasma_model=plasma name=2_33 \
    expression="e- + CF2 = CF + F + e-" \
    rate_coefficient_type=arrhenius \
    a=1.190e-16 b=1.309 c=1.446e5 energy_transfer=5.4<eV>

add_bulk_reaction plasma_model=plasma name=2_34 \
    expression="e- + CF2 = CF2+ + 2e-" \
    rate_coefficient_type=arrhenius \
    a=1.579e-11 b=0.6287 c=1.125e5 energy_transfer=10.0<eV>

add_bulk_reaction plasma_model=plasma name=2_35 \
    expression="e- + CF2 = CF+ + F + 2e-" \
    rate_coefficient_type=arrhenius \
    a=2.454e-12 b=0.7803 c=1.602e5 energy_transfer=14.23<eV>

add_bulk_reaction plasma_model=plasma name=2_36 \
    expression="e- + CF2 = F+ + CF + 2e-" \
    rate_coefficient_type=arrhenius \
    a=1.676e-9 b=0.2519 c=4.446e5 energy_transfer=22.9<eV>

add_bulk_reaction plasma_model=plasma name=2_37 \
    expression="e- + CF2 = CF + F-" \
    rate_coefficient_type=arrhenius \
    a=2.369e-8 b=-0.4893 c=5.876e4 energy_transfer=1.9<eV>

add_bulk_reaction plasma_model=plasma name=2_38 \
    expression="e- + CF = C + F + e-" \
    rate_coefficient_type=arrhenius \
    a=1.190e-16 b=1.309 c=1.446e5 energy_transfer=5.6<eV>

add_bulk_reaction plasma_model=plasma name=2_39 \
    expression="e- + CF = CF+ + 2e-" \
    rate_coefficient_type=arrhenius \
    a=1.270e-13 b=1.038 c=1.027e5 energy_transfer=9.11<eV>

add_bulk_reaction plasma_model=plasma name=2_40 \
    expression="e- + CF = C + F-" \
    rate_coefficient_type=arrhenius \
    a=2.369e-8 b=-0.4893 c=5.876e4 energy_transfer=2.1<eV>

add_bulk_reaction plasma_model=plasma name=2_41 \
    expression="e- + C = C + e-" \
    rate_coefficient_type=arrhenius \
    a=4.882e-6 b=-0.5042 c=2.459e4 energy_transfer=1.264<eV>

add_bulk_reaction plasma_model=plasma name=2_42 \
    expression="e- + C = C + e-" \
    rate_coefficient_type=arrhenius \
    a=6.939e-7 b=-0.5041 c=4.163e4 energy_transfer=2.684<eV>

add_bulk_reaction plasma_model=plasma name=2_43 \
    expression="e- + F = F + e-" \
    rate_coefficient_type=arrhenius \
    a=1.56e-6 b=-0.6504 c=1.66287e5 energy_transfer=12.7<eV>

add_bulk_reaction plasma_model=plasma name=2_44 \
    expression="e- + F = F + e-" \
    rate_coefficient_type=arrhenius \
    a=5.93e-9 b=-0.0528 c=1.60465e5 energy_transfer=12.985<eV>

add_bulk_reaction plasma_model=plasma name=2_45 \
    expression="e- + F = F+ + 2e-" \
    rate_coefficient_type=arrhenius \
    a=7.489e-13 b=0.8595 c=2.042e5 energy_transfer=17.42<eV>

add_bulk_reaction plasma_model=plasma name=2_46 \
    expression="e- + SiF4 = SiF4 + e-" \
    rate_coefficient_type=arrhenius \
    a=4.78e-3 b=-1.351 c=4.704e3 energy_transfer=0.032<eV>

add_bulk_reaction plasma_model=plasma name=2_47 \
    expression="e- + SiF4 = SiF4 + e-" \
    rate_coefficient_type=arrhenius \
    a=4.73e-3 b=-1.350 c=4.799e3 energy_transfer=0.052<eV>

add_bulk_reaction plasma_model=plasma name=2_48 \
    expression="e- + SiF4 = SiF4 + e-" \
    rate_coefficient_type=arrhenius \
    a=2.947e-6 b=-0.4119 c=4.606e3 energy_transfer=0.10<eV>

add_bulk_reaction plasma_model=plasma name=2_49 \
    expression="e- + SiF4 = SiF3 + F + e-" \
    rate_coefficient_type=arrhenius \
    a=2.268e-12 b=-0.8182 c=1.302e5 energy_transfer=7.25<eV>

add_bulk_reaction plasma_model=plasma name=2_50 \
    expression="e- + SiF4 = SiF2 + 2F + e-" \
    rate_coefficient_type=arrhenius \
    a=1.223e-8 b=0.01834 c=1.86e5 energy_transfer=11.9<eV>

add_bulk_reaction plasma_model=plasma name=2_51 \
    expression="e- + SiF4 = SiF + 3F + e-" \
    rate_coefficient_type=arrhenius \
    a=1.039e-16 b=1.187 c=2.203e5 energy_transfer=18.6<eV>

add_bulk_reaction plasma_model=plasma name=2_52 \
    expression="e- + SiF4 = SiF3+ + F + 2e-" \
    rate_coefficient_type=arrhenius \
    a=2.291e-11 b=0.6641 c=2.022e5 energy_transfer=16.0<eV>

add_bulk_reaction plasma_model=plasma name=2_53 \
    expression="e- + SiF4 = SiF2+ + 2F + 2e-" \
    rate_coefficient_type=arrhenius \
    a=2.886e-11 b=0.5108 c=2.649e5 energy_transfer=23.4<eV>

add_bulk_reaction plasma_model=plasma name=2_54 \
    expression="e- + SiF4 = SiF+ + 3F + 2e-" \
    rate_coefficient_type=arrhenius \
    a=2.296e-14 b=1.090 c=3.132e5 energy_transfer=25.1<eV>

add_bulk_reaction plasma_model=plasma name=2_55 \
    expression="e- + SiF4 = F+ + SiF3 + 2e-" \
    rate_coefficient_type=arrhenius \
    a=1.482e-13 b=0.9375 c=4.023e5 energy_transfer=24.75<eV>

add_bulk_reaction plasma_model=plasma name=2_56 \
    expression="e- + SiF4 = SiF3 + F-" \
    rate_coefficient_type=arrhenius \
    a=1.245e-8 b=-0.3792 c=1.14e5 energy_transfer=3.8<eV>

add_bulk_reaction plasma_model=plasma name=2_57 \
    expression="e- + SiF3 = SiF2 + F + e-" \
    rate_coefficient_type=arrhenius \
    a=1.190e-16 b=1.309 c=1.446e5 energy_transfer=4.6<eV>

add_bulk_reaction plasma_model=plasma name=2_58 \
    expression="e- + SiF3 = SiF + 2F + e-" \
    rate_coefficient_type=arrhenius \
    a=1.039e-16 b=1.187 c=2.203e5 energy_transfer=11.4<eV>

add_bulk_reaction plasma_model=plasma name=2_59 \
    expression="e- + SiF3 = SiF3+ + 2e-" \
    rate_coefficient_type=arrhenius \
    a=3.265e-10 b=0.3633 c=1.185e5 energy_transfer=9.60<eV>

add_bulk_reaction plasma_model=plasma name=2_60 \
    expression="e- + SiF3 = SiF2+ + F + 2e-" \
    rate_coefficient_type=arrhenius \
    a=1.939e-10 b=0.4660 c=1.752e5 energy_transfer=15.9<eV>

add_bulk_reaction plasma_model=plasma name=2_61 \
    expression="e- + SiF3 = SiF+ + 2F + 2e-" \
    rate_coefficient_type=arrhenius \
    a=7.0474e-12 b=0.6944 c=1.974e5 energy_transfer=17.43<eV>

add_bulk_reaction plasma_model=plasma name=2_62 \
    expression="e- + SiF3 = Si+ + 3F + 2e-" \
    rate_coefficient_type=arrhenius \
    a=1.801e-10 b=0.3139 c=3.343e5 energy_transfer=25.6<eV>
    
add_bulk_reaction plasma_model=plasma name=2_63 \
    expression="e- + SiF3 = SiF2 + F-" \
    rate_coefficient_type=arrhenius \
    a=1.245e-8 b=-0.3792 c=1.14e5 energy_transfer=3.0<eV>

add_bulk_reaction plasma_model=plasma name=2_64 \
    expression="e- + SiF2 = SiF + F + e-" \
    rate_coefficient_type=arrhenius \
    a=1.190e-16 b=1.309 c=1.446e5 energy_transfer=6.8<eV>

add_bulk_reaction plasma_model=plasma name=2_65 \
    expression="e- + SiF2 = SiF2+ + 2e-" \
    rate_coefficient_type=arrhenius \
    a=2.620e-9 b=0.2530 c=1.348e5 energy_transfer=10.8<eV>

add_bulk_reaction plasma_model=plasma name=2_66 \
    expression="e- + SiF2 = SiF+ + F + 2e-" \
    rate_coefficient_type=arrhenius \
    a=3.597e-13 b=0.9855 c=1.592e5 energy_transfer=15.2<eV>

add_bulk_reaction plasma_model=plasma name=2_67 \
    expression="e- + SiF2 = Si+ + 2F + 2e-" \
    rate_coefficient_type=arrhenius \
    a=7.940e-11 b=0.4722 c=3.459e5 energy_transfer=22.4<eV>

add_bulk_reaction plasma_model=plasma name=2_68 \
    expression="e- + SiF2 = SiF + F-" \
    rate_coefficient_type=arrhenius \
    a=1.245e-8 b=-0.3792 c=1.140e5 energy_transfer=3.0<eV>

add_bulk_reaction plasma_model=plasma name=2_69 \
    expression="e- + SiF = Si + F + e-" \
    rate_coefficient_type=arrhenius \
    a=1.190e-16 b=1.309 c=1.446e5 energy_transfer=6.0<eV>

add_bulk_reaction plasma_model=plasma name=2_70 \
    expression="e- + SiF = SiF+ + 2e-" \
    rate_coefficient_type=arrhenius \
    a=2.963e-9 b=0.3258 c=9.052e4 energy_transfer=7.26<eV>

add_bulk_reaction plasma_model=plasma name=2_71 \
    expression="e- + SiF = Si+ + F + 2e-" \
    rate_coefficient_type=arrhenius \
    a=3.888e-10 b=0.4391 c=1.628e5 energy_transfer=14.3<eV>

add_bulk_reaction plasma_model=plasma name=2_72 \
    expression="e- + SiF = Si + F+ + 2e-" \
    rate_coefficient_type=arrhenius \
    a=7.116e-11 b=0.3962 c=2.580e5 energy_transfer=23.1<eV>

add_bulk_reaction plasma_model=plasma name=2_73 \
    expression="e- + SiF = Si + F-" \
    rate_coefficient_type=arrhenius \
    a=1.245e-8 b=-0.379 c=1.14e5 energy_transfer=3.0<eV>

add_bulk_reaction plasma_model=plasma name=2_74 \
    expression="e- + O2 = O2 + e-" \
    rate_coefficient_type=arrhenius \
    a=3.1064e-7 b=-0.967 c=-2.210e4 energy_transfer=0.19<eV>

add_bulk_reaction plasma_model=plasma name=2_75 \
    expression="e- + O2 = O2 + e-" \
    rate_coefficient_type=arrhenius \
    a=3.070e-4 b=-1.02 c=5.332e4 energy_transfer=0.19<eV>

add_bulk_reaction plasma_model=plasma name=2_76 \
    expression="e- + O2 = O2 + e-" \
    rate_coefficient_type=arrhenius \
    a=4.792e-5 b=-0.9297 c=5.650e4 energy_transfer=0.38<eV>

add_bulk_reaction plasma_model=plasma name=2_77 \
    expression="e- + O2 = O2 + e-" \
    rate_coefficient_type=arrhenius \
    a=2.987e-4 b=-1.133 c=5.656e4 energy_transfer=0.57<eV>

add_bulk_reaction plasma_model=plasma name=2_78 \
    expression="e- + O2 = O2 + e-" \
    rate_coefficient_type=arrhenius \
    a=1.88e-3 b=-1.338 c=5.662e4 energy_transfer=0.75<eV>

add_bulk_reaction plasma_model=plasma name=2_79 \
    expression="e- + O2 = O2 + e-" \
    rate_coefficient_type=arrhenius \
    a=1.426e-6 b=-0.5896 c=5.782e4 energy_transfer=0.98<eV>

add_bulk_reaction plasma_model=plasma name=2_80 \
    expression="e- + O2 = O2 + e-" \
    rate_coefficient_type=arrhenius \
    a=3.020e-7 b=-0.5739 c=6.214e4 energy_transfer=1.63<eV>

add_bulk_reaction plasma_model=plasma name=2_81 \
    expression="e- + O2 = O2 + e-" \
    rate_coefficient_type=arrhenius \
    a=2.288e-10 b=0.4019 c=6.865e4 energy_transfer=6.2<eV>

add_bulk_reaction plasma_model=plasma name=2_82 \
    expression="e- + O2 = 2O + e-" \
    rate_coefficient_type=arrhenius \
    a=1.880e-3 b=-1.267 c=5.466e4 energy_transfer=4.5<eV>

add_bulk_reaction plasma_model=plasma name=2_83 \
    expression="e- + O2 = 2O + e-" \
    rate_coefficient_type=arrhenius \
    a=4.854e-7 b=-0.4485 c=5.719e4 energy_transfer=6.0<eV>

add_bulk_reaction plasma_model=plasma name=2_84 \
    expression="e- + O2 = 2O + e-" \
    rate_coefficient_type=arrhenius \
    a=4.247e-10 b=0.3654 c=5.611e4 energy_transfer=8.4<eV>

add_bulk_reaction plasma_model=plasma name=2_85 \
    expression="e- + O2 = 2O + e-" \
    rate_coefficient_type=arrhenius \
    a=1.703e-16 b=1.290 c=7.557e4 energy_transfer=10.0<eV>

add_bulk_reaction plasma_model=plasma name=2_86 \
    expression="e- + O2 = 2O + e-" \
    rate_coefficient_type=arrhenius \
    a=8.486e-16 b=1.121 c=7.535e4 energy_transfer=14.7<eV>

add_bulk_reaction plasma_model=plasma name=2_87 \
    expression="e- + O2 = O2+ + e-" \
    rate_coefficient_type=arrhenius \
    a=1.404e-15 b=1.419 c=6.549e4 energy_transfer=12.1<eV>

add_bulk_reaction plasma_model=plasma name=2_88 \
    expression="e- + O = O + e-" \
    rate_coefficient_type=arrhenius \
    a=9.606e-7 b=-0.4471 c=5.505e4 energy_transfer=1.97<eV>

add_bulk_reaction plasma_model=plasma name=2_89 \
    expression="e- + O = O + e-" \
    rate_coefficient_type=arrhenius \
    a=2.736e-8 b=-0.3368 c=6.291e4 energy_transfer=4.19<eV>

add_bulk_reaction plasma_model=plasma name=2_90 \
    expression="e- + O = O+ + 2e-" \
    rate_coefficient_type=arrhenius \
    a=2.314e-15 b=-1.328 c=6.650e4 energy_transfer=13.6<eV>

add_bulk_reaction plasma_model=plasma name=2_91 \
    expression="e- + CO = CO + e-" \
    rate_coefficient_type=arrhenius \
    a=6.564e-2 b=-1.434 c=2.253e4 energy_transfer=0.27<eV>

add_bulk_reaction plasma_model=plasma name=2_92 \
    expression="e- + CO = CO + e-" \
    rate_coefficient_type=arrhenius \
    a=3.333e-2 b=-1.433 c=2.149e4 energy_transfer=0.53<eV>

add_bulk_reaction plasma_model=plasma name=2_93 \
    expression="e- + CO = CO + e-" \
    rate_coefficient_type=arrhenius \
    a=1.319e-2 b=-1.421 c=2.077e4 energy_transfer=0.79<eV>

add_bulk_reaction plasma_model=plasma name=2_94 \
    expression="e- + CO = CO + e-" \
    rate_coefficient_type=arrhenius \
    a=1.360e-2 b=-1.471 c=2.149e4 energy_transfer=1.04<eV>

add_bulk_reaction plasma_model=plasma name=2_95 \
    expression="e- + CO = CO + e-" \
    rate_coefficient_type=arrhenius \
    a=4.056e-5 b=-0.647 c=9.68e4 energy_transfer=6.22<eV>

add_bulk_reaction plasma_model=plasma name=2_96 \
    expression="e- + CO = CO + e-" \
    rate_coefficient_type=arrhenius \
    a=5.203e-4 b=-0.9815 c=1.35e5 energy_transfer=6.8<eV>

add_bulk_reaction plasma_model=plasma name=2_97 \
    expression="e- + CO = CO + e-" \
    rate_coefficient_type=arrhenius \
    a=1.742e-6b=-0.3538 c=1.776e5 energy_transfer=7.9<eV>

add_bulk_reaction plasma_model=plasma name=2_98 \
    expression="e- + CO = CO + e-" \
    rate_coefficient_type=arrhenius \
    a=6.127e-5 b=-0.8693 c=1.685e5 energy_transfer=10.4<eV>

add_bulk_reaction plasma_model=plasma name=2_99 \
    expression="e- + CO = CO + e-" \
    rate_coefficient_type=arrhenius \
    a=4.756e-7 b=-0.2813 c=2.052e5 energy_transfer=10.6<eV>

add_bulk_reaction plasma_model=plasma name=2_100 \
    expression="e- + CO = C + O + e-" \
    rate_coefficient_type=arrhenius \
    a=3.70e-12 b=0.731 c=1.25795e5 energy_transfer=13.5<eV>

add_bulk_reaction plasma_model=plasma name=2_101 \
    expression="e- + CO = CO+ + 2e-" \
    rate_coefficient_type=arrhenius \
    a=2.199e-7 b=-0.0487 c=2.762e5 energy_transfer=14.0<eV>

add_bulk_reaction plasma_model=plasma name=2_102 \
    expression="e- + CF3+ = CF2 + F" \
    rate_coefficient_type=arrhenius \
    a=4.0e-8 b=0 c=0 energy_transfer=0

add_bulk_reaction plasma_model=plasma name=2_103 \
    expression="e- + CF2+ = CF + F" \
    rate_coefficient_type=arrhenius \
    a=4.0e-8 b=0 c=0 energy_transfer=0

add_bulk_reaction plasma_model=plasma name=2_104 \
    expression="e- + CF+ = C + F" \
    rate_coefficient_type=arrhenius \
    a=4.0e-8 b=0 c=0 energy_transfer=0

add_bulk_reaction plasma_model=plasma name=2_105 \
    expression="e- + SiF3+ = SiF2 + F" \
    rate_coefficient_type=arrhenius \
    a=4.0e-8 b=0 c=0 energy_transfer=0

add_bulk_reaction plasma_model=plasma name=2_106 \
    expression="e- + SiF2+ = SiF + F" \
    rate_coefficient_type=arrhenius \
    a=4.0e-8 b=0 c=0 energy_transfer=0

add_bulk_reaction plasma_model=plasma name=2_107 \
    expression="e- + SiF+ = Si + F" \
    rate_coefficient_type=arrhenius \
    a=4.0e-8 b=0 c=0 energy_transfer=0

add_bulk_reaction plasma_model=plasma name=2_108 \
    expression="e- + CO+ = C + O" \
    rate_coefficient_type=arrhenius \
    a=4.0e-8 b=0 c=0 energy_transfer=0

add_bulk_reaction plasma_model=plasma name=2_109 \
    expression="e- + O2+ = 2O" \
    rate_coefficient_type=arrhenius \
    a=4.0e-8 b=0 c=0 energy_transfer=0

add_bulk_reaction plasma_model=plasma name=2_110 \
    expression="F- + CF3 = CF4 + e-" \
    rate_coefficient_type=arrhenius \
    a=4.0e-10 b=0 c=0 energy_transfer=0

add_bulk_reaction plasma_model=plasma name=2_111 \
    expression="F- + CF2 = CF3 + e-" \
    rate_coefficient_type=arrhenius \
    a=3.0e-10 b=0 c=0 energy_transfer=0

add_bulk_reaction plasma_model=plasma name=2_112 \
    expression="F- + CF = CF2 + e-" \
    rate_coefficient_type=arrhenius \
    a=2.0e-10 b=0 c=0 energy_transfer=0

add_bulk_reaction plasma_model=plasma name=2_113 \
    expression="F- + C = CF + e-" \
    rate_coefficient_type=arrhenius \
    a=1.0e-10 b=0 c=0 energy_transfer=0

add_bulk_reaction plasma_model=plasma name=2_114 \
    expression="F- + F = 2F + e-" \
    rate_coefficient_type=arrhenius \
    a=1.0e-10 b=0 c=0 energy_transfer=0

add_bulk_reaction plasma_model=plasma name=2_115 \
    expression="F- + SiF3 = SiF4 + e-" \
    rate_coefficient_type=arrhenius \
    a=4.0e-10 b=0 c=0 energy_transfer=0

add_bulk_reaction plasma_model=plasma name=2_116 \
    expression="F- + SiF2 = SiF3 + e-" \
    rate_coefficient_type=arrhenius \
    a=3.0e-10 b=0 c=0 energy_transfer=0    

add_bulk_reaction plasma_model=plasma name=2_117 \
    expression="F- + SiF = SiF2 + e-" \
    rate_coefficient_type=arrhenius \
    a=2.0e-10 b=0 c=0 energy_transfer=0  

add_bulk_reaction plasma_model=plasma name=2_118 \
    expression="F- + Si = SiF + e-" \
    rate_coefficient_type=arrhenius \
    a=1.0e-10 b=0 c=0 energy_transfer=0  

add_bulk_reaction plasma_model=plasma name=2_119 \
    expression="F- + O = F + O + e-" \
    rate_coefficient_type=arrhenius \
    a=1.0e-10 b=0 c=0 energy_transfer=0  

add_bulk_reaction plasma_model=plasma name=2_120 \
    expression="O+ + O2 = O2+ + O" \
    rate_coefficient_type=arrhenius \
    a=2.10e-11 b=0 c=0 energy_transfer=0  

add_bulk_reaction plasma_model=plasma name=2_121 \
    expression="F+ + O2 = O2+ + F" \
    rate_coefficient_type=arrhenius \
    a=7.007e-10 b=0 c=0 energy_transfer=0  

add_bulk_reaction plasma_model=plasma name=2_122 \
    expression="F- + CF3+ = 2F + CF2" \
    rate_coefficient_type=arrhenius \
    a=4.0e-7 b=-0.5 c=0 energy_transfer=0  

add_bulk_reaction plasma_model=plasma name=2_123 \
    expression="F- + CF2+ = F + CF2" \
    rate_coefficient_type=arrhenius \
    a=4.0e-7 b=-0.5 c=0 energy_transfer=0  

add_bulk_reaction plasma_model=plasma name=2_124 \
    expression="F- + CF+ = 2F + C" \
    rate_coefficient_type=arrhenius \
    a=4.0e-7 b=-0.5 c=0 energy_transfer=0  

add_bulk_reaction plasma_model=plasma name=2_125 \
    expression="F- + F+ = 2F" \
    rate_coefficient_type=arrhenius \
    a=4.0e-7 b=-0.5 c=0 energy_transfer=0  

add_bulk_reaction plasma_model=plasma name=2_126 \
    expression="F- + Si+ = F + Si" \
    rate_coefficient_type=arrhenius \
    a=4.0e-7 b=-0.5 c=0 energy_transfer=0  

add_bulk_reaction plasma_model=plasma name=2_127 \
    expression="F- + SiF+ = F + SiF" \
    rate_coefficient_type=arrhenius \
    a=4.0e-7 b=-0.5 c=0 energy_transfer=0  

add_bulk_reaction plasma_model=plasma name=2_128 \
    expression="F- + SiF2+ = 2F + SiF" \
    rate_coefficient_type=arrhenius \
    a=4.0e-7 b=-0.5 c=0 energy_transfer=0  

add_bulk_reaction plasma_model=plasma name=2_129 \
    expression="F- + SiF3+ = 2F + SiF2" \
    rate_coefficient_type=arrhenius \
    a=4.0e-7 b=-0.5 c=0 energy_transfer=0  

add_bulk_reaction plasma_model=plasma name=2_130 \
    expression="F- + O+ = F + O" \
    rate_coefficient_type=arrhenius \
    a=4.0e-7 b=-0.5 c=0 energy_transfer=0  

add_bulk_reaction plasma_model=plasma name=2_131 \
    expression="F- + O2+ = F + O2" \
    rate_coefficient_type=arrhenius \
    a=4.0e-7 b=-0.5 c=0 energy_transfer=0  

add_bulk_reaction plasma_model=plasma name=2_132 \
    expression="F- + CO+ = F + CO" \
    rate_coefficient_type=arrhenius \
    a=4.0e-7 b=-0.5 c=0 energy_transfer=0  

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