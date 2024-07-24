# Etch SiO2 using reaction model and plasma data
# Reaction set from Ho et. al. "Chemical reaction Mechanisms for Modeling the Fluorocarbon Plasma Etch of Silicon Oxide and Related Materials"

# Define model
set NEUTRALIZED_EV 1
set F_SD_PATH f_sd.txt
set CF_SD_PATH cf_sd.txt
set CF2_SD_PATH cf2_sd.txt
set CF3_SD_PATH cf3_sd.txt
set X_SD_PATH x_sd.txt
set MASK_HOLE_PATH maskhole50nm.gds
define_model name=etcher description="CF4/CHF3/Ar/O2 ICP/RIE Etch Model"
define_species_distribution type=ead_file file=F_SD_PATH \
    name=F_all species=F
define_species_distribution type=ead_file file=CF_SD_PATH \
    name=CF_all species=CF
define_species_distribution type=ead_file file=CF2_SD_PATH \
    name=CF2_all species=CF2
define_species_distribution type=ead_file file=CF3_SD_PATH \
    name=CF3_all species=CF3
define_species_distribution type=ead_file file=X_SD_PATH \
    name=X_all species=X

# Add species from both tables
add_source_species model=etcher name=F
add_source_species model=etcher name=CF
add_source_species model=etcher name=CF2
add_source_species model=etcher name=CF3
add_source_species model=etcher name=X
add_source_species model=etcher name=SiO2
add_source_species model=etcher name=SiO2_F2
add_source_species model=etcher name=SiO2_CF2

# Add reactions from Table 4 sorted by reactant
# F
add_reaction model=etcher name=4_1 expression="F<g> + SiO2<s> = SiF4<v> + O2<v>"
add_reaction model=etcher name=4_2 expression="F<g> + SiO2<s> = SiO2_F2<s>"
add_reaction model=etcher name=4_9_SiO2 expression="F<g> + SiO2<s> = SiF4<v> + O2<v> + F<g>"
add_reaction model=etcher name=4_9_SiO2_F2 expression="F<g> + SiO2_F2<s> = SiO2<s> + F<g>"
add_reaction model=etcher name=4_20_SiO2 expression="F<g> + SiO2_CF2<s> = SiF4<v> + F<g>"
add_reaction model=etcher name=4_20_SiO2_CF2 expression="F<g> + SiO2_CF2<s> = SiO2<s> + CO<v> + F<g>"
add_reaction model=etcher name=4_31 expression="F<g> + SiO2<s> = F<g> + SiO2<s>"
add_reaction model=etcher name=4_42 expression="F<g> + SiO2<s> = SiO2_F2<s>"
add_reaction model=etcher name=4_46 expression="F<g> + SiO2_CF2<s> = SiO2<s> + CF4<v>"

# CF
add_reaction model=etcher name=4_5_SiO2 expression="CF<g> + SiO2<s> = SiO2_CF2<s>"
add_reaction model=etcher name=4_5_SiO2_F2 expression="CF<g> + SiO2_F2<s> = SiO2_CF2<s>"
add_reaction model=etcher name=4_8_SiO2 expression="CF<g> + SiO2<s> = SiF4<v> + O2<v> + CF<g>"
add_reaction model=etcher name=4_8_SiO2_F2 expression="CF<g> + SiO2_F2<s> = SiO2<s> + CF<g>"
add_reaction model=etcher name=4_19_SiO2 expression="CF<g> + SiO2<s> = SiF4<v> + CF<g>"
add_reaction model=etcher name=4_19_SiO2_CF2 expression="CF<g> + SiO2_CF2<s> = SiO2<s> + CO<v> + CF<g>"
add_reaction model=etcher name=4_30 expression="CF<g> + SiO2<s> = CF<g> + SiO2<s>"
add_reaction model=etcher name=4_41_SiO2 expression="CF<g> + SiO2<s> = SiO2_F2<s>"
add_reaction model=etcher name=4_41_SiO2_F2 expression="CF<g> + SiO2_F2<s> = SiO2_CF2<s>"

# CF2
add_reaction model=etcher name=4_3 expression="CF2<g> + SiO2<s> = SiO2_CF2<s>"
add_reaction model=etcher name=4_6_SiO2 expression="CF2<g> + SiO2<s> = SiF4<v> + O2<v> + CF2<g>"
add_reaction model=etcher name=4_6_SiO2_F2 expression="CF2<g> + SiO2_F2<s> = SiO2<s>"
add_reaction model=etcher name=4_17_SiO2 expression="CF2<g> + SiO2<s> = SiF4<v> + CO<v> + CF2<g>"
add_reaction model=etcher name=4_17_SiO2_CF2 expression="CF2<g> + SiO2_CF2<s> = SiO2<s>"
add_reaction model=etcher name=4_29 expression="CF2<g> + SiO2<s> = CF2<g> + SiO2<s>"
add_reaction model=etcher name=4_40 expression="CF2<g> + SiO2<s> = SiO2_CF2<s>"

# CF3
add_reaction model=etcher name=4_4_SiO2_F2 expression="CF3<g> + SiO2<s> = SiO2_F2<s>"
add_reaction model=etcher name=4_4_SiO2_CF2 expression="CF3<g> + SiO2<s> = SiO2_CF2<s>"
add_reaction model=etcher name=4_7_SiO2 expression="CF3<g> + SiO2<s> = SiF4<v> + O2<v> + CF3<g>"
add_reaction model=etcher name=4_7_SiO2_F2 expression="CF3<g> + SiO2_F2<s> = SiO2<s>"
add_reaction model=etcher name=4_18_SiO2 expression="CF3<g> + SiO2<s> = SiF4<v> + CF3<g>"
add_reaction model=etcher name=4_18_SiO2_CF2 expression="CF3<g> + SiO2_CF2<s> = SiO2<s> + CO<v>"
add_reaction model=etcher name=4_28 expression="CF3<g> + SiO2<s> = CF3<g> + SiO2<s>"
add_reaction model=etcher name=4_39_SiO2_F2 expression="CF3<g> + SiO2<s> = SiO2_F2<s>"
add_reaction model=etcher name=4_39_SiO2_CF2 expression="CF3<g> + SiO2<s> = SiO2_CF2<s>"

# Sputtering on SiO2
add_reaction model=etcher name=sputter_SiO2 expression="SiO2<s> + X<g> = SiO2<q>"
add_reaction model=etcher name=sputter_SiO2_F2 expression="SiO2_F2<s> + X<g> = SiO2_F2<q>"
add_reaction model=etcher name=sputter_SiO2_CF2 expression="SiO2_CF2<s> + X<g> = SiO2_CF2<q>"

finalize_model model=etcher

# Add reaction properties to etch machine of each reactant
define_etch_machine model=etcher name=etch_f species_distribution=F_all
add_reaction_properties reaction=4_1 machine=etch_f \
    activation_energy=0.163<eV> p=3.955e-3
add_reaction_properties reaction=4_2 machine=etch_f p=0.01
add_reaction_properties reaction=4_9_SiO2 machine=etch_f p=8.333e-3 \
    energy_exponent=0.5 energy_threshold=4<eV> energy_reference=9<eV> \
    product_energy_max=NEUTRALIZED_EV
add_reaction_properties reaction=4_9_SiO2_F2 machine=etch_f p=8.333e-3 \
    energy_exponent=0.5 energy_threshold=4<eV> energy_reference=9<eV> 
add_reaction_properties reaction=4_20_SiO2 machine=etch_f p=8.667e-3 \
    energy_exponent=0.5 energy_threshold=4<eV> energy_reference=9<eV> \
    product_energy_max=NEUTRALIZED_EV
add_reaction_properties reaction=4_20_SiO2_CF2 machine=etch_f p=8.667e-3 \
    energy_exponent=0.5 energy_threshold=4<eV> energy_reference=9<eV> 
add_reaction_properties reaction=4_31 machine=etch_f \
    p=0.8 energy_threshold=4<eV> product_energy_max=NEUTRALIZED_EV
add_reaction_properties reaction=4_42 machine=etch_f \
    p=0.1 energy_threshold=4<eV> product_energy_max=NEUTRALIZED_EV
add_reaction_properties reaction=4_42 machine=etch_f \
    p=5e-3 energy_threshold=4<eV>

define_etch_machine model=etcher name=etch_cf species_distribution=CF_all
add_reaction_properties reaction=4_5_SiO2 machine=etch_cf p=0.333
add_reaction_properties reaction=4_5_SiO2_F2 machine=etch_cf p=0.333
add_reaction_properties reaction=4_8_SiO2 machine=etch_cf p=1.367e-2 \
    energy_exponent=0.5 energy_threshold=4<eV> energy_reference=9<eV> \
    product_energy_max=NEUTRALIZED_EV
add_reaction_properties reaction=4_8_SiO2_F2 machine=etch_cf p=1.367e-2 \
    energy_exponent=0.5 energy_threshold=4<eV> energy_reference=9<eV> 
add_reaction_properties reaction=4_19_SiO2 machine=etch_cf p=0.14 \
    energy_exponent=0.5 energy_threshold=4<eV> energy_reference=9<eV> \
    product_energy_max=NEUTRALIZED_EV
add_reaction_properties reaction=4_19_SiO2_CF2 machine=etch_cf p=0.14 \
    energy_exponent=0.5 energy_threshold=4<eV> energy_reference=9<eV> 
add_reaction_properties reaction=4_30 machine=etch_cf \
    p=0.8 energy_threshold=4<eV> product_energy_max=NEUTRALIZED_EV
add_reaction_properties reaction=4_41_SiO2 machine=etch_cf \
    p=0.05 energy_threshold=4<eV> 
add_reaction_properties reaction=4_41_SiO2_F2 machine=etch_cf \
    p=0.05 energy_threshold=4<eV>

define_etch_machine model=etcher name=etch_cf2 species_distribution=CF2_all
add_reaction_properties reaction=4_3 machine=etch_cf2 p=0.66
add_reaction_properties reaction=4_6_SiO2 machine=etch_cf2 p=0.022 \
    energy_exponent=0.5 energy_threshold=4<eV> energy_reference=9<eV> \
    product_energy_max=NEUTRALIZED_EV
add_reaction_properties reaction=4_6_SiO2_F2 machine=etch_cf2 p=0.022 \
    energy_exponent=0.5 energy_threshold=4<eV> energy_reference=9<eV> 
add_reaction_properties reaction=4_17_SiO2 machine=etch_cf2 p=2.23e-3 \
    energy_exponent=0.5 energy_threshold=4<eV> energy_reference=9<eV> \
    product_energy_max=NEUTRALIZED_EV
add_reaction_properties reaction=4_17_SiO2_CF2 machine=etch_cf2 p=2.23e-3 \
    energy_exponent=0.5 energy_threshold=4<eV> energy_reference=9<eV> 
add_reaction_properties reaction=4_29 machine=etch_cf2 \
    p=0.8 energy_threshold=4<eV> product_energy_max=NEUTRALIZED_EV
add_reaction_properties reaction=4_40 machine=etch_cf2 \
    p=0.2 energy_threshold=4<eV>

define_etch_machine model=etcher name=etch_cf3 species_distribution=CF3_all
add_reaction_properties reaction=4_4_SiO2 machine=etch_cf3 p=0.05
add_reaction_properties reaction=4_4_SiO2_F2 machine=etch_cf3 p=0.05
add_reaction_properties reaction=4_7_SiO2 machine=etch_cf3 p=3.067e-2 \
    energy_exponent=0.5 energy_threshold=4<eV> energy_reference=9<eV> \
    product_energy_max=NEUTRALIZED_EV
add_reaction_properties reaction=4_7_SiO2_F2 machine=etch_cf3 p=3.067e-2 \
    energy_exponent=0.5 energy_threshold=4<eV> energy_reference=9<eV> 
add_reaction_properties reaction=4_18_SiO2 machine=etch_cf3 p=0.031 \
    energy_exponent=0.5 energy_threshold=4<eV> energy_reference=9<eV> \
    product_energy_max=NEUTRALIZED_EV
add_reaction_properties reaction=4_18_SiO2_CF2 machine=etch_cf3 p=0.031 \
    energy_exponent=0.5 energy_threshold=4<eV> energy_reference=9<eV> 
add_reaction_properties reaction=4_28 machine=etch_cf3 \
    p=0.8 energy_threshold=4<eV> product_energy_max=NEUTRALIZED_EV
add_reaction_properties reaction=4_39_SiO2_F2 machine=etch_cf3 \
    p=0.05 energy_threshold=4<eV>
add_reaction_properties reaction=4_39_SiO2_CF2 machine=etch_cf3 \
    p=0.05 energy_threshold=4<eV>

# Create structure to etch
define_structure material=Pt point_min={0 0 0} \
    point_max={0.1 0.1 0.1}

# Deposit oxide
define_deposit_machine anisotropy=0.8 curvature=0 \
    material=SiO2 model=simple rate=1
deposit spacing=0.1 time=0.1

# Ideal resist mask
define_layout name=maskholelayout cell=TOP \
    layout_file=MASK_HOLE_PATH scale=1 \
    domain_min= {0 0} domain_max= {0.1 0.1} \
    layer_names= {maskhole} layer_numbers= {1:0} \
    shift_to_origin=false
define_mask name=mask1 layout=maskholelayout \
    domain=SIM3D layer=maskhole
pattern mask=mask1 material=Resist accuracy=0.001 \
    thickness=0.1 type=dark_positive
save

# Etch hole
etch machine=etch_f method=pmc spacing= {0.001 0.001 0.001} time=0.5
etch machine=etch_cf method=pmc spacing= {0.001 0.001 0.001} time=0.5
etch machine=etch_cf2 method=pmc spacing= {0.001 0.001 0.001} time=0.5
etch machine=etch_cf3 method=pmc spacing= {0.001 0.001 0.001} time=0.5
save
