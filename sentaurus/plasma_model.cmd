# CF4 etch only

# Define plasma model
define_plasma_model name=plasma bulk_model_type=global sheath_model_type=circuit

# CF4 Species
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

# CF4 Reactions from Tonelli et. al.
# "A global model study of low pressure high density CF4 discharge"

# TABLE 1 - CF4 electron collisions
add_bulk_reaction plasma_model=plasma name=1_5 \
    expression="e- + CF4 = CF3 + F + e-" \
    rate_coefficient_type=arrhenius \
    a=1.369e-16 b=2.048 c=7.557 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=1_6 \
    expression="e- + CF4 = CF2 + 2F + e-" \
    rate_coefficient_type=arrhenius \
    a=1.359e-18 b=1.693 c=13.104 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=1_7 \
    expression="e- + CF4 = CF + 3F + e-" \
    rate_coefficient_type=arrhenius \
    a=7.215e-17 b=0.277 c=27.151 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=1_8 \
    expression="e- + CF4 = CF3+ + F + 2e-" \
    rate_coefficient_type=arrhenius \
    a=1.083e-14 b=0.969 c=17.803 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=1_9 \
    expression="e- + CF4 = CF2+ + 2F + 2e-" \
    rate_coefficient_type=arrhenius \
    a=3.310e-16 b=1.365 c=18.373 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=1_10 \
    expression="e- + CF4 = CF+ + 3F + 2e-" \
    rate_coefficient_type=arrhenius \
    a=7.171e-19 b=3.453 c=14.244 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=1_11 \
    expression="e- + CF4 = CF3 + F+ + 2e-" \
    rate_coefficient_type=arrhenius \
    a=1.297e-18 b=2.786 c=18.557 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=1_12 \
    expression="e- + CF4 = C+ + 4F + 2e-" \
    rate_coefficient_type=arrhenius \
    a=9.154e-20 b=3.847 c=12.082 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=1_13 \
    expression="e- + CF4 = CF3+ + F+ + 3e-" \
    rate_coefficient_type=arrhenius \
    a=5.611e-17 b=1.157 c=37.455 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=1_14 \
    expression="e- + CF4 = CF2+ + F+ + F + 3e-" \
    rate_coefficient_type=arrhenius \
    a=8.207e-17 b=1.163 c=42.737 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=1_15 \
    expression="e- + CF4 = CF+ + F+ + 2F + 3e-" \
    rate_coefficient_type=arrhenius \
    a=5.217e-17 b=1.520 c=47.145 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=1_16 \
    expression="e- + CF4 = C+ + F+ + 3F + 3e-" \
    rate_coefficient_type=arrhenius \
    a=4.075e-17 b=1.353 c=61.618 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=1_17 \
    expression="e- + CF4 = CF3 + F-" \
    rate_coefficient_type=arrhenius \
    a=1.086e-15 b=-1.336 c=6.691 energy_transfer=0<eV>

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

# Table 2 - CF3 electron collisions
add_bulk_reaction plasma_model=plasma name=2_27 \
    expression="e- + CF3 = CF2 + F + e-" \
    rate_coefficient_type=arrhenius \
    a=3.257e-15 b=0.690 c=3.650 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=2_28 \
    expression="e- + CF3 = CF3+ + 2e-" \
    rate_coefficient_type=arrhenius \
    a=1.427e-15 b=0.838 c=9.549 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=2_29 \
    expression="e- + CF3 = CF2+ + F + 2e-" \
    rate_coefficient_type=arrhenius \
    a=8.362e-15 b=0.444 c=17.368 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=2_30 \
    expression="e- + CF3 = CF+ + 2F + 2e-" \
    rate_coefficient_type=arrhenius \
    a=5.257e-15 b=0.555 c=21.232 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=2_31 \
    expression="e- + CF3 = CF2 + F+ + 2e-" \
    rate_coefficient_type=arrhenius \
    a=2.669e-15 b=0.820 c=27.018 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=2_32 \
    expression="e- + CF3 = CF2 + F-" \
    rate_coefficient_type=arrhenius \
    a=1.402e-12 b=-1.408 c=0.013 energy_transfer=0<eV>

# Table 3 - CF2 electron collisions
add_bulk_reaction plasma_model=plasma name=3_36 \
    expression="e- + CF2 = CF + F + e-" \
    rate_coefficient_type=arrhenius \
    a=3.257e-15 b=0.690 c=5.390 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=3_37 \
    expression="e- + CF2 = CF2+ + 2e-" \
    rate_coefficient_type=arrhenius \
    a=4.330e-15 b=0.775 c=9.485 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=3_38 \
    expression="e- + CF2 = CF+ + F + 2e-" \
    rate_coefficient_type=arrhenius \
    a=6.032e-15 b=0.497 c=14.539 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=3_39 \
    expression="e- + CF2 = CF+ + F+ + 3e-" \
    rate_coefficient_type=arrhenius \
    a=3.176e-14 b=-0.111 c=31.314 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=3_40 \
    expression="e- + CF2 = CF + F+ + 2e-" \
    rate_coefficient_type=arrhenius \
    a=1.588e-14 b=-0.111 c=31.314 energy_transfer=0<eV>

# Table 5 - CF electron collisions
add_bulk_reaction plasma_model=plasma name=5_50 \
    expression="e- + CF = C + F + e-" \
    rate_coefficient_type=arrhenius \
    a=5.633e-14 b=-1.318 c=7.158 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=5_50 \
    expression="e- + CF = CF+ + 2e-" \
    rate_coefficient_type=arrhenius \
    a=4.295e-15 b=0.800 c=11.541 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=5_50 \
    expression="e- + CF = C + F+ + 2e-" \
    rate_coefficient_type=arrhenius \
    a=1.985e-14 b=-0.111 c=31.314 energy_transfer=0<eV>

# Table 7, 8, 9 - F2, F, C
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
    a=4.711e-16 b=1.411 c=12.618 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=9_120 \
    expression="e- + C = C+ + 2e-" \
    rate_coefficient_type=arrhenius \
    a=3.692e-15 b=1.182 c=9.332 energy_transfer=0<eV>

# Table 10 - Ion electron collisions
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

# Table 12 - Charge exchange
add_bulk_reaction plasma_model=plasma name=12_145 \
    expression="CF2+ + CF4 = CF3+ + CF3" \
    rate_coefficient_type=arrhenius \
    a=4.00e-16 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=12_146 \
    expression="CF2+ + CF3 = CF3+ + CF2" \
    rate_coefficient_type=arrhenius \
    a=1.48e-15 b=0 c=0 energy_transfer=0<eV>

add_bulk_reaction plasma_model=plasma name=12_147 \
    expression="CF2+ + C = CF+ + CF" \
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

# Table 13 - electron detachment
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

# Solve for species flux distributions in plasma
define_reactor name=chamber plasma_model=plasma \
    type=icp radius=12<cm> height=10<cm> \
    power=500<W> pressure=10<mTorr> gas_temperature=400<K> \
    rf_bias_frequency=13.6<MHz> rf_bias_power=20<W> \
    inlet_gas_flow= {{CF4 20<sccm>}} 
define_bulk_solver name=bulk_solver bulk_model_type=global \
    max_time=180<s> stationary_state_tolerance=8e-3 step_size=1e-4
solve_reactor name=plasma_sol reactor=chamber bulk_solver=bulk_solver
