# Plasma model for CF4/CHF3/Ar ICP/RIE etch
# References:
# CF4 Reactions from Tonelli et. al. 
# "A global model study of low pressure high density CF4 discharge"
#  Electron collision energy losses from Ho et. al. 
# "Chemical reaction Mechanisms for Modeling the Fluorocarbon
#  Plasma Etch of Silicon Oxide and Related Materials"

# Etcher settings
set RF_POWER_W 200
set PRESSURE_MTORR 10
set CF4_SCCM 20
set AR_SCCM 5
set CHF3_SCCM 5
set GAS_FLOWS [list [list "CF4 $CF4_SCCM<sccm>"] \
    [list "Ar $AR_SCCM<sccm>"] \
    [list "CHF3 $CHF3_SCCM<sccm>"]]

# Miscellaneous etcher settings
set CHAMBER_RADIUS_CM 12
set CHAMBER_HEIGHT_CM 10
set GAS_TEMP_K 400
set PLASMA_TOLERANCE 1e-3
set PLASMA_STEP_SIZE 1e-4
set MAX_SOLVER_SEC 180

# Species distribution paths
set F_SD_PATH f_sd.txt
set CF_SD_PATH cf_sd.txt
set CF2_SD_PATH cf2_sd.txt
set CF3_SD_PATH cf3_sd.txt
set CHF_SD_PATH chf_sd.txt
set CHF2_SD_PATH chf2_sd.txt
set H_SD_PATH h_sd.txt
set H2_SD_PATH H2_sd.txt
set AR_SD_PATH ar_sd.txt

# Define plasma model
define_plasma_model name=plasma \
    bulk_model_type=global sheath_model_type=circuit

# Species from CF4, CHF3, and Ar
add_species plasma_model=plasma name=CF4   mass=88.003<amu>  charge=0
add_species plasma_model=plasma name=F2+   mass=37.996<amu>  charge=+1
add_species plasma_model=plasma name=F2    mass=37.996<amu>  charge=0
add_species plasma_model=plasma name=F2-   mass=37.996<amu>  charge=-1
add_species plasma_model=plasma name=C+    mass=12.011<amu>  charge=+1
add_species plasma_model=plasma name=C     mass=12.011<amu>  charge=0
add_species plasma_model=plasma name=CF3+  mass=69.005<amu> charge=+1
add_species plasma_model=plasma name=CF3   mass=69.005<amu> charge=0
add_species plasma_model=plasma name=CF3-  mass=69.005<amu> charge=-1
add_species plasma_model=plasma name=CF2+  mass=50.007<amu> charge=+1
add_species plasma_model=plasma name=CF2   mass=50.007<amu> charge=0
add_species plasma_model=plasma name=CF+   mass=31.009<amu> charge=+1
add_species plasma_model=plasma name=CF    mass=31.009<amu> charge=0 
add_species plasma_model=plasma name=F+    mass=18.998<amu> charge=+1
add_species plasma_model=plasma name=F     mass=18.998<amu> charge=0
add_species plasma_model=plasma name=F-    mass=18.998<amu> charge=-1
add_species plasma_model=plasma name=Ar    mass=39.948<amu> charge=0
add_species plasma_model=plasma name=Ar+   mass=39.948<amu> charge=+1
add_species plasma_model=plasma name=CHF3  mass=70.0128<amu>  charge=0
add_species plasma_model=plasma name=CHF2+ mass=51.0148<amu>  charge=+1
add_species plasma_model=plasma name=CHF2  mass=51.0148<amu>  charge=0
add_species plasma_model=plasma name=CHF+  mass=32.0168<amu>  charge=+1
add_species plasma_model=plasma name=CHF   mass=32.0168<amu>  charge=0
add_species plasma_model=plasma name=HF    mass=20.0058<amu>  charge=0
add_species plasma_model=plasma name=H2+   mass=2.0156<amu>   charge=+1
add_species plasma_model=plasma name=H2    mass=2.0156<amu>   charge=0
add_species plasma_model=plasma name=H+    mass=1.0078<amu>   charge=+1
add_species plasma_model=plasma name=H     mass=1.0078<amu>   charge=0

# TABLE 1 - CF4 Electron Collisions
add_bulk_reaction plasma_model=plasma name=1_5 \
    expression="e- + CF4 = CF3 + F + e-" \
    rate_coefficient_type=arrhenius \
    a=1.369e-16 b=2.048 c=7.557 energy_transfer=5.6<eV>

add_bulk_reaction plasma_model=plasma name=1_6 \
    expression="e- + CF4 = CF2 + 2F + e-" \
    rate_coefficient_type=arrhenius \
    a=1.359e-18 b=1.693 c=13.104 energy_transfer=9.5<eV>

add_bulk_reaction plasma_model=plasma name=1_7 \
    expression="e- + CF4 = CF + 3F + e-" \
    rate_coefficient_type=arrhenius \
    a=7.215e-17 b=0.277 c=27.151 energy_transfer=14.9<eV>

add_bulk_reaction plasma_model=plasma name=1_8 \
    expression="e- + CF4 = CF3+ + F + 2e-" \
    rate_coefficient_type=arrhenius \
    a=1.083e-14 b=0.969 c=17.803 energy_transfer=15.9<eV>

add_bulk_reaction plasma_model=plasma name=1_9 \
    expression="e- + CF4 = CF2+ + 2F + 2e-" \
    rate_coefficient_type=arrhenius \
    a=3.310e-16 b=1.365 c=18.373 energy_transfer=22.0<eV>

add_bulk_reaction plasma_model=plasma name=1_10 \
    expression="e- + CF4 = CF+ + 3F + 2e-" \
    rate_coefficient_type=arrhenius \
    a=7.171e-19 b=3.453 c=14.244 energy_transfer=27.0<eV>

add_bulk_reaction plasma_model=plasma name=1_11 \
    expression="e- + CF4 = CF3 + F+ + 2e-" \
    rate_coefficient_type=arrhenius \
    a=1.297e-18 b=2.786 c=18.557 energy_transfer=23.1<eV>

add_bulk_reaction plasma_model=plasma name=1_12 \
    expression="e- + CF4 = C+ + 4F + 2e-" \
    rate_coefficient_type=arrhenius \
    a=9.154e-20 b=3.847 c=12.082 energy_transfer=32.0<eV> # estimated

add_bulk_reaction plasma_model=plasma name=1_13 \
    expression="e- + CF4 = CF3+ + F+ + 3e-" \
    rate_coefficient_type=arrhenius \
    a=5.611e-17 b=1.157 c=37.455 energy_transfer=36.0<eV>

add_bulk_reaction plasma_model=plasma name=1_14 \
    expression="e- + CF4 = CF2+ + F+ + F + 3e-" \
    rate_coefficient_type=arrhenius \
    a=8.207e-17 b=1.163 c=42.737 energy_transfer=40.0<eV>

add_bulk_reaction plasma_model=plasma name=1_15 \
    expression="e- + CF4 = CF+ + F+ + 2F + 3e-" \
    rate_coefficient_type=arrhenius \
    a=5.217e-17 b=1.520 c=47.145 energy_transfer=42.0<eV>

add_bulk_reaction plasma_model=plasma name=1_16 \
    expression="e- + CF4 = C+ + F+ + 3F + 3e-" \
    rate_coefficient_type=arrhenius \
    a=4.075e-17 b=1.353 c=61.618 energy_transfer=44.0<eV> # estimated

add_bulk_reaction plasma_model=plasma name=1_17 \
    expression="e- + CF4 = CF3 + F-" \
    rate_coefficient_type=arrhenius \
    a=1.086e-15 b=-1.336 c=6.691 energy_transfer=3.0<eV>

add_bulk_reaction plasma_model=plasma name=1_18 \
    expression="e- + CF4 = CF2 + F2-" \
    rate_coefficient_type=arrhenius \
    a=1.96e-17 b=-1.300 c=6.247 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=1_19 \
    expression="e- + CF4 = CF3- + F" \
    rate_coefficient_type=arrhenius \
    a=2.545e-16 b=-1.374 c=7.120 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=1_20 \
    expression="e- + CF4 = CF3+ + F- + e-" \
    rate_coefficient_type=arrhenius \
    a=4.086e-19 b=0.650 c=16.738 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=1_21 \
    expression="e- + CF4 = CF2+ + F + F- + e-" \
    rate_coefficient_type=arrhenius \
    a=2.567e-19 b=0.412 c=21.866 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=1_22 \
    expression="e- + CF4 = CF+ + F- + 2F + e-" \
    rate_coefficient_type=arrhenius \
    a=8.439e-19 b=0.723 c=21.994 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=1_23 \
    expression="e- + CF4 = CF2 + F+ + F- + e-" \
    rate_coefficient_type=arrhenius \
    a=5.087e-19 b=0.636 c=27.714 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=1_24 \
    expression="e- + CF4 = C+ + F- + 3F + e-" \
    rate_coefficient_type=arrhenius \
    a=2.395e-18 b=0.420 c=28.416 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=1_25 \
    expression="e- + CF4 = CF2+ + F2-" \
    rate_coefficient_type=arrhenius \
    a=3.691e-19 b=0.051 c=10.163 energy_transfer=0<eV>

# Table 2 - CF3 Electron Collisions
add_bulk_reaction plasma_model=plasma name=2_27 \
    expression="e- + CF3 = CF2 + F + e-" \
    rate_coefficient_type=arrhenius \
    a=3.257e-15 b=0.690 c=3.650 energy_transfer=3.8<eV>

add_bulk_reaction plasma_model=plasma name=2_28 \
    expression="e- + CF3 = CF3+ + 2e-" \
    rate_coefficient_type=arrhenius \
    a=1.427e-15 b=0.838 c=9.549 energy_transfer=10.0<eV>

add_bulk_reaction plasma_model=plasma name=2_29 \
    expression="e- + CF3 = CF2+ + F + 2e-" \
    rate_coefficient_type=arrhenius \
    a=8.362e-15 b=0.444 c=17.368 energy_transfer=17.1<eV>

add_bulk_reaction plasma_model=plasma name=2_30 \
    expression="e- + CF3 = CF+ + 2F + 2e-" \
    rate_coefficient_type=arrhenius \
    a=5.257e-15 b=0.555 c=21.232 energy_transfer=21.4<eV>

add_bulk_reaction plasma_model=plasma name=2_31 \
    expression="e- + CF3 = CF2 + F+ + 2e-" \
    rate_coefficient_type=arrhenius \
    a=2.669e-15 b=0.820 c=27.018 energy_transfer=21.3<eV>

add_bulk_reaction plasma_model=plasma name=2_32 \
    expression="e- + CF3 = CF2 + F-" \
    rate_coefficient_type=arrhenius \
    a=1.402e-12 b=-1.408 c=0.013 energy_transfer=0.40<eV>

# Table 3 - CF2 Electron Collisions
add_bulk_reaction plasma_model=plasma name=3_36 \
    expression="e- + CF2 = CF + F + e-" \
    rate_coefficient_type=arrhenius \
    a=3.257e-15 b=0.690 c=5.390 energy_transfer=5.4<eV>

add_bulk_reaction plasma_model=plasma name=3_37 \
    expression="e- + CF2 = CF2+ + 2e-" \
    rate_coefficient_type=arrhenius \
    a=4.330e-15 b=0.775 c=9.485 energy_transfer=10.0<eV>

add_bulk_reaction plasma_model=plasma name=3_38 \
    expression="e- + CF2 = CF+ + F + 2e-" \
    rate_coefficient_type=arrhenius \
    a=6.032e-15 b=0.497 c=14.539 energy_transfer=14.23<eV>

add_bulk_reaction plasma_model=plasma name=3_39 \
    expression="e- + CF2 = CF+ + F+ + 3e-" \
    rate_coefficient_type=arrhenius \
    a=3.176e-14 b=-0.111 c=31.314 energy_transfer=25.0<eV> # estimated

add_bulk_reaction plasma_model=plasma name=3_40 \
    expression="e- + CF2 = CF + F+ + 2e-" \
    rate_coefficient_type=arrhenius \
    a=1.588e-14 b=-0.111 c=31.314 energy_transfer=22.9<eV>

# Table 5 - CF Electron Collisions
add_bulk_reaction plasma_model=plasma name=5_50 \
    expression="e- + CF = C + F + e-" \
    rate_coefficient_type=arrhenius \
    a=5.633e-14 b=-1.318 c=7.158 energy_transfer=5.6<eV>

add_bulk_reaction plasma_model=plasma name=5_51 \
    expression="e- + CF = CF+ + 2e-" \
    rate_coefficient_type=arrhenius \
    a=4.295e-15 b=0.800 c=11.541 energy_transfer=9.11<eV>

add_bulk_reaction plasma_model=plasma name=5_52 \
    expression="e- + CF = C + F+ + 2e-" \
    rate_coefficient_type=arrhenius \
    a=1.985e-14 b=-0.111 c=31.314 energy_transfer=9.0<eV> # estimated

# Table 7, 8, 9 - F2, F, C Electron Collisions
add_bulk_reaction plasma_model=plasma name=7_59 \
    expression="e- + F2 = 2F + e-" \
    rate_coefficient_type=arrhenius \
    a=4.983e-15 b=0.400 c=3.947 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=7_62 \
    expression="e- + F2 = F2+ + 2e-" \
    rate_coefficient_type=arrhenius \
    a=6.71e-16 b=1.240 c=16.822 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=7_63 \
    expression="e- + F2 = F+ + F- + e-" \
    rate_coefficient_type=arrhenius \
    a=9.432e-17 b=1.341 c=17.322 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=7_64 \
    expression="e- + F2 = F + F-" \
    rate_coefficient_type=arrhenius \
    a=1.124e-15 b=-1.475 c=0.535 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=8_91 \
    expression="e- + F = F+ + 2e-" \
    rate_coefficient_type=arrhenius \
    a=4.711e-16 b=1.411 c=12.618 energy_transfer=17.42<eV>

add_bulk_reaction plasma_model=plasma name=9_120 \
    expression="e- + C = C+ + 2e-" \
    rate_coefficient_type=arrhenius \
    a=3.692e-15 b=1.182 c=9.332 energy_transfer=0<eV>

# Table 10 - Ion Electron Collisions
add_bulk_reaction plasma_model=plasma name=10_121 \
    expression="e- + CF3+ = CF3" \
    rate_coefficient_type=arrhenius \
    a=3.950e-15 b=-0.5 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=10_122 \
    expression="e- + CF3+ = CF2 + F" \
    rate_coefficient_type=arrhenius \
    a=4.475e-15 b=-1.441 c=0.41 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=10_123 \
    expression="e- + CF3+ = CF + 2F" \
    rate_coefficient_type=arrhenius \
    a=1.119e-15 b=-1.441 c=0.41 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=10_124 \
    expression="e- + CF2+ = CF2" \
    rate_coefficient_type=arrhenius \
    a=6e-14 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=10_125 \
    expression="e- + CF2+ = CF + F" \
    rate_coefficient_type=arrhenius \
    a=8.376e-15 b=-1.496 c=0.172 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=10_126 \
    expression="e- + CF2+ = C + 2F" \
    rate_coefficient_type=arrhenius \
    a=3.421e-15 b=-1.496 c=0.172 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=10_127 \
    expression="e- + CF+ = C + F" \
    rate_coefficient_type=arrhenius \
    a=2.805e-15 b=-0.8 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=10_128 \
    expression="e- + F2+ = 2F" \
    rate_coefficient_type=arrhenius \
    a=3.21e-14 b=-0.5 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=10_129 \
    expression="e- + F2- = F2 + 2e-" \
    rate_coefficient_type=arrhenius \
    a=6.186e-15 b=-0.535 c=11.092 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=10_130 \
    expression="e- + F2- = F + F- + e-" \
    rate_coefficient_type=arrhenius \
    a=5.812e-15 b=0.062 c=11.498 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=10_131 \
    expression="e- + F2- = 2F + 2e-" \
    rate_coefficient_type=arrhenius \
    a=1.354e-14 b=0.484 c=2.178 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=10_132 \
    expression="e- + F- = F + 2e-" \
    rate_coefficient_type=arrhenius \
    a=3.047e-14 b=0.413 c=11.167 energy_transfer=0<eV>

# Table 12 - Charge Exchange
add_bulk_reaction plasma_model=plasma name=12_145 \
    expression="CF2+ + CF4 = CF3+ + CF3" \
    rate_coefficient_type=arrhenius \
    a=4.00e-16 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=12_146 \
    expression="CF2+ + CF3 = CF3+ + CF2" \
    rate_coefficient_type=arrhenius \
    a=1.48e-15 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=12_147 \
    expression="CF2+ + C = CF3+ + C" \
    rate_coefficient_type=arrhenius \
    a=2.06e-15 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=12_148 \
    expression="CF2+ + C = CF+ + CF" \
    rate_coefficient_type=arrhenius \
    a=1.04e-15 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=12_149 \
    expression="CF+ + CF4 = CF3+ + CF2" \
    rate_coefficient_type=arrhenius \
    a=1.80e-16 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=12_150 \
    expression="CF+ + CF3 = CF3+ + CF" \
    rate_coefficient_type=arrhenius \
    a=1.71e-15 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=12_151 \
    expression="CF+ + CF2 = CF2+ + CF" \
    rate_coefficient_type=arrhenius \
    a=1.00e-15 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=12_152 \
    expression="C+ + CF3 = CF3+ + C" \
    rate_coefficient_type=arrhenius \
    a=5.00e-16 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=12_153 \
    expression="C+ + CF3 = CF2+ + CF" \
    rate_coefficient_type=arrhenius \
    a=2.48e-15 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=12_154 \
    expression="C+ + CF2 = CF2+ + C" \
    rate_coefficient_type=arrhenius \
    a=5.00e-16 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=12_155 \
    expression="C+ + CF = CF+ + C" \
    rate_coefficient_type=arrhenius \
    a=3.18e-15 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=12_156 \
    expression="F2+ + CF4 = CF3+ + F + F2" \
    rate_coefficient_type=arrhenius \
    a=1.00e-16 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=12_157 \
    expression="F2+ + CF3 = CF3+ + F2" \
    rate_coefficient_type=arrhenius \
    a=1.00e-16 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=12_158 \
    expression="F2+ + CF3 = CF3+ + 2F" \
    rate_coefficient_type=arrhenius \
    a=1.60e-15 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=12_159 \
    expression="F2+ + CF2 = CF2+ + F2" \
    rate_coefficient_type=arrhenius \
    a=1.00e-15 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=12_160 \
    expression="F2+ + CF2 = CF3+ + F" \
    rate_coefficient_type=arrhenius \
    a=1.79e-15 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=12_161 \
    expression="F2+ + CF = CF2+ + F" \
    rate_coefficient_type=arrhenius \
    a=2.18e-15 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=12_162 \
    expression="F2+ + C = CF+ + F" \
    rate_coefficient_type=arrhenius \
    a=1.04e-15 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=12_163 \
    expression="F+ + CF4 = CF3+ + F2" \
    rate_coefficient_type=arrhenius \
    a=1.00e-15 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=12_164 \
    expression="F+ + CF3 = CF3+ + F" \
    rate_coefficient_type=arrhenius \
    a=1.00e-15 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=12_165 \
    expression="F+ + CF3 = CF2+ + F2" \
    rate_coefficient_type=arrhenius \
    a=2.09e-15 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=12_166 \
    expression="F+ + CF2 = CF+ + F2" \
    rate_coefficient_type=arrhenius \
    a=2.28e-15 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=12_167 \
    expression="F+ + CF = CF+ + F" \
    rate_coefficient_type=arrhenius \
    a=5.00e-16 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=12_168 \
    expression="F+ + CF = C+ + F2" \
    rate_coefficient_type=arrhenius \
    a=2.71e-15 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=12_169 \
    expression="F+ + C = C+ + F" \
    rate_coefficient_type=arrhenius \
    a=1.17e-15 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=12_170 \
    expression="F+ + F2 = F2+ + F" \
    rate_coefficient_type=arrhenius \
    a=7.94e-16 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=12_171 \
    expression="CF3- + F = CF3 + F-" \
    rate_coefficient_type=arrhenius \
    a=5.00e-15 b=0 c=0 energy_transfer=0<eV>

# Table 13 - Electron Detachment
add_bulk_reaction plasma_model=plasma name=13_172 \
    expression="F- + CF4 = CF4 + F + e-" \
    rate_coefficient_type=arrhenius \
    a=2.132e-14 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=13_173 \
    expression="F- + CF3 = CF4 + e-" \
    rate_coefficient_type=arrhenius \
    a=5e-16 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=13_174 \
    expression="F- + CF2 = CF3 + e-" \
    rate_coefficient_type=arrhenius \
    a=5e-16 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=13_175 \
    expression="F- + CF = CF2 + e-" \
    rate_coefficient_type=arrhenius \
    a=5e-16 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=13_176 \
    expression="F- + C = CF + e-" \
    rate_coefficient_type=arrhenius \
    a=1e-16 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=13_177 \
    expression="F- + F = F2 + 2e-" \
    rate_coefficient_type=arrhenius \
    a=1e-16 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=13_178 \
    expression="F- + F = 2F + e-" \
    rate_coefficient_type=arrhenius \
    a=1e-16 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=13_179 \
    expression="F2- + CF4 = F2 + CF4 + e-" \
    rate_coefficient_type=arrhenius \
    a=5e-16 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=13_180 \
    expression="F2- + CF3 = F2 + CF3 + e-" \
    rate_coefficient_type=arrhenius \
    a=5e-16 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=13_181 \
    expression="F2- + F = F2 + F + e-" \
    rate_coefficient_type=arrhenius \
    a=1e-16 b=0 c=0 energy_transfer=0<eV>

# Table 14 - Recombination
add_bulk_reaction plasma_model=plasma name=14_182 \
    expression="CF3- + CF3+ = 2CF3" \
    rate_coefficient_type=arrhenius \
    a=1e-13 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=14_183 \
    expression="CF3- + CF2+ = CF3 + CF2" \
    rate_coefficient_type=arrhenius \
    a=5e-13 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=14_184 \
    expression="CF3- + CF+ = CF3 + CF" \
    rate_coefficient_type=arrhenius \
    a=2e-13 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=14_185 \
    expression="CF3- + C+ = CF3 + C" \
    rate_coefficient_type=arrhenius \
    a=3e-13 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=14_186 \
    expression="CF3- + F2+ = CF3 + F2" \
    rate_coefficient_type=arrhenius \
    a=2e-13 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=14_187 \
    expression="CF3- + F+ = CF3 + F" \
    rate_coefficient_type=arrhenius \
    a=2.5e-13 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=14_188 \
    expression="F- + CF3+ = CF4" \
    rate_coefficient_type=arrhenius \
    a=5e-14 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=14_189 \
    expression="F- + CF3+ = CF3 + F" \
    rate_coefficient_type=arrhenius \
    a=1e-13 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=14_190 \
    expression="F- + CF3+ = CF2 + F2" \
    rate_coefficient_type=arrhenius \
    a=8.7e-14 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=14_191 \
    expression="F- + CF2+ = CF + F2" \
    rate_coefficient_type=arrhenius \
    a=9.1e-14 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=14_192 \
    expression="F- + CF2+ = CF2 + F" \
    rate_coefficient_type=arrhenius \
    a=5e-13 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=14_193 \
    expression="F- + CF+ = CF + F" \
    rate_coefficient_type=arrhenius \
    a=4e-13 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=14_194 \
    expression="F- + C+ = C + F" \
    rate_coefficient_type=arrhenius \
    a=1.2e-13 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=14_195 \
    expression="F- + F2+ = F + F2" \
    rate_coefficient_type=arrhenius \
    a=9.4e-14 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=14_196 \
    expression="F- + F+ = 2F" \
    rate_coefficient_type=arrhenius \
    a=1.1e-13 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=14_197 \
    expression="F2- + CF3 = F2 + CF3" \
    rate_coefficient_type=arrhenius \
    a=1e-13 b=0 c=0 energy_transfer=0<eV>

# Argon Ionization
add_bulk_reaction plasma_model=plasma name=ar_ion \
    expression="Ar + e- = Ar+ + 2e-" \
    rate_coefficient_type=arrhenius \
    a=2.3e-14 b=0.6329 c=16.0627 energy_transfer=15.76<eV>

# TABLE 9a - Other CHF3 Reactions
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

# Solve for species flux distributions in plasma
define_reactor name=chamber plasma_model=plasma \
    type=icp radius=$CHAMBER_RADIUS_CM<cm> \
    height=$CHAMBER_HEIGHT_CM<cm> power=$RF_POWER_W<W> \
    rf_bias_frequency=13.6<MHz> rf_bias_power=$RF_POWER_W<W> \
    pressure=$PRESSURE_MTORR<mTorr> \
    gas_temperature=$GAS_TEMP_K<K> inlet_gas_flow=$GAS_FLOWS 
define_bulk_solver name=bulk_solver bulk_model_type=global \
    max_time=$MAX_SOLVER_SEC<s> \
    stationary_state_tolerance=$PLASMA_TOLERANCE \
    step_size=$PLASMA_STEP_SIZE
solve_reactor name=plasma_sol reactor=chamber bulk_solver=bulk_solver

# Reactive and sputtering species distributions saved to reaction model
define_species_distribution type=plasma solution=plasma_sol \
    name=F+ species=F+ 
define_species_distribution type=plasma solution=plasma_sol \
    name=F species=F 
define_species_distribution type=plasma solution=plasma_sol \
    name=F- species=F- 
define_species_distribution type=sum name=F_all species=F \
    distributions= {{F+ F+} {F F} {F- F-}}

define_species_distribution type=plasma solution=plasma_sol \
    name=CF+ species=CF+ 
define_species_distribution type=plasma solution=plasma_sol \
    name=CF  species=CF  
define_species_distribution type=sum name=CF_all species=CF \
    distributions= {{CF+ CF+} {CF CF}}

define_species_distribution type=plasma solution=plasma_sol \
    name=CF2+ species=CF2+ 
define_species_distribution type=plasma solution=plasma_sol \
    name=CF2  species=CF2  
define_species_distribution type=sum name=CF2_all species=CF2 \
    distributions= {{CF2+ CF2+} {CF2 CF2}}

define_species_distribution type=plasma solution=plasma_sol \
    name=CF3+ species=CF3+ 
define_species_distribution type=plasma solution=plasma_sol \
    name=CF3  species=CF3  
define_species_distribution type=plasma solution=plasma_sol \
    name=CF3- species=CF3- 
define_species_distribution type=sum name=CF3_all species=CF3 \
    distributions= {{CF3+ CF3+} {CF3 CF3} {CF3- CF3-}}

define_species_distribution type=plasma solution=plasma_sol \
    name=CHF2+ species=CHF2+ 
define_species_distribution type=plasma solution=plasma_sol \
    name=CHF2  species=CHF2  
define_species_distribution type=sum name=CHF2_all species=CHF2 \
    distributions= {{CHF2+ CHF2+} {CHF2 CHF2}}

define_species_distribution type=plasma solution=plasma_sol \
    name=CHF+ species=CHF+ 
define_species_distribution type=plasma solution=plasma_sol \
    name=CHF  species=CHF  
define_species_distribution type=sum name=CHF_all species=CHF \
    distributions= {{CHF+ CHF+} {CHF CHF}}

define_species_distribution type=plasma solution=plasma_sol \
    name=H2+ species=H2+ 
define_species_distribution type=plasma solution=plasma_sol \
    name=H2  species=H2  
define_species_distribution type=sum name=H2_all species=H2 \
    distributions= {{H2+ H2+} {H2 H2}}

define_species_distribution type=plasma solution=plasma_sol \
    name=H+ species=H+ 
define_species_distribution type=plasma solution=plasma_sol \
    name=H  species=H  
define_species_distribution type=sum name=H_all species=H \
    distributions= {{H+ H+} {H H}}

define_species_distribution type=plasma solution=plasma_sol \
    name=Ar+ species=Ar+ 
define_species_distribution type=plasma solution=plasma_sol \
    name=Ar species=Ar  
define_species_distribution type=sum name=Ar_all species=Ar \
    distributions= {{Ar+ Ar+} {Ar Ar}}

# Save species distributions
save species_distribution=F_all \
    species=F file_type=text file=$F_SD_PATH
save species_distribution=CF_all \
    species=CF file_type=text file=$CF_SD_PATH
save species_distribution=CF2_all \
    species=CF2 file_type=text file=$CF2_SD_PATH
save species_distribution=CF3_all \
    species=CF3 file_type=text file=$CF3_SD_PATH
save species_distribution=Ar_all \
    species=Ar file_type=text file=$AR_SD_PATH
save species_distribution=CHF_all \
    species=CHF file_type=text file=$CHF_SD_PATH
save species_distribution=CHF2_all \
    species=CHF2 file_type=text file=$CHF2_SD_PATH
save species_distribution=H_all \
    species=H file_type=text file=$H_SD_PATH
save species_distribution=H2_all \
    species=H2 file_type=text file=$H2_SD_PATH
