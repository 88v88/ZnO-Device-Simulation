# Etch SiO2 using reaction model and plasma data

# Reaction set from Ho et. al. 
# "Chemical reaction Mechanisms for Modeling the Fluorocarbon
#  Plasma Etch of Silicon Oxide and Related Materials"

# Etch settings
set GRID_SIZE_UM 0.002
set ETCH_INTERVAL_MIN 0.1
set N_ETCH_INTERVALS 10
set MASK_XSIZE_UM 0.1
set MASK_YSIZE_UM 0.1
set NEUTRALIZED_EV 1
set MAX_EV 250

# Input files
set F_SD_PATH f_sd.txt
set CF_SD_PATH cf_sd.txt
set CF2_SD_PATH cf2_sd.txt
set CF3_SD_PATH cf3_sd.txt
set AR_SD_PATH ar_sd.txt
set MASK_HOLE_PATH maskhole50nm.gds

# Extract species distributions
define_species_distribution type=ead_file file=$F_SD_PATH \
    name=F_all species=F energy_min=0 energy_max=$MAX_EV
define_species_distribution type=ead_file file=$CF_SD_PATH \
    name=CF_all species=CF energy_min=0 energy_max=$MAX_EV
define_species_distribution type=ead_file file=$CF2_SD_PATH \
    name=CF2_all species=CF2 energy_min=0 energy_max=$MAX_EV
define_species_distribution type=ead_file file=$CF3_SD_PATH \
    name=CF3_all species=CF3 energy_min=0 energy_max=$MAX_EV
define_species_distribution type=ead_file file=$AR_SD_PATH \
    name=Ar_all species=Ar energy_min=0 energy_max=$MAX_EV

# Define reaction models
define_model name=etcher_f \
    description="CF4/CHF3/Ar RIE Etch Model with F"
add_source_species model=etcher_f name=F
add_reaction model=etcher_f name=4_1_9_SiO2 \
    expression="F<g> + SiO2<s> = SiF4<v> + O2<v>"
add_reaction model=etcher_f name=4_2_42 \
    expression="F<g> + SiO2<s> = SiO2_F2<s>"
add_reaction model=etcher_f name=4_9_SiO2_F2 \
    expression="F<g> + SiO2_F2<s> = SiO2<s>"
add_reaction model=etcher_f name=4_20_SiO2 \
    expression="F<g> + SiO2_CF2<s> = SiF4<v>"
add_reaction model=etcher_f name=4_46_20_SiO2_CF2 \
    expression="F<g> + SiO2_CF2<s> = SiO2<s> + CF4<v>"
finalize_model model=etcher_f

define_model name=etcher_cf \
    description="CF4/CHF3/Ar RIE Etch Model with CF"
add_source_species model=etcher_cf name=CF
add_reaction model=etcher_cf name=4_5_SiO2 \
    expression="CF<g> + SiO2<s> = SiO2_CF2<s>"
add_reaction model=etcher_cf name=4_5_41_SiO2_F2 \
    expression="CF<g> + SiO2_F2<s> = SiO2_CF2<s>"
add_reaction model=etcher_cf name=4_8_19_SiO2 \
    expression="CF<g> + SiO2<s> = SiF4<v>"
add_reaction model=etcher_cf name=4_8_SiO2_F2 \
    expression="CF<g> + SiO2_F2<s> = SiO2<s>"
add_reaction model=etcher_cf name=4_19_SiO2_CF2 \
    expression="CF<g> + SiO2_CF2<s> = SiO2<s>"
add_reaction model=etcher_cf name=4_41_SiO2 \
    expression="CF<g> + SiO2<s> = SiO2_F2<s>"
finalize_model model=etcher_cf 

define_model name=etcher_cf2 \
    description="CF4/CHF3/Ar RIE Etch Model with CF2"
add_source_species model=etcher_cf2 name=CF2
add_reaction model=etcher_cf2 name=4_3_40 \
    expression="CF2<g> + SiO2<s> = SiO2_CF2<s>"
add_reaction model=etcher_cf2 name=4_6_17_SiO2 \
    expression="CF2<g> + SiO2<s> = SiF4<v>"
add_reaction model=etcher_cf2 name=4_6_SiO2_F2 \
    expression="CF2<g> + SiO2_F2<s> = SiO2<s>"
add_reaction model=etcher_cf2 name=4_17_SiO2_CF2 \
    expression="CF2<g> + SiO2_CF2<s> = SiO2<s>"
finalize_model model=etcher_cf2

define_model name=etcher_cf3 \
    description="CF4/CHF3/Ar RIE Etch Model with CF3"
add_source_species model=etcher_cf3 name=CF3
add_reaction model=etcher_cf3 name=4_4_39_SiO2_F2 \
    expression="CF3<g> + SiO2<s> = SiO2_F2<s>"
add_reaction model=etcher_cf3 name=4_4_39_SiO2_CF2 \
    expression="CF3<g> + SiO2<s> = SiO2_CF2<s>"
add_reaction model=etcher_cf3 name=4_7_18_SiO2 \
    expression="CF3<g> + SiO2<s> = SiF4<v>"
add_reaction model=etcher_cf3 name=4_7_SiO2_F2 \
    expression="CF3<g> + SiO2_F2<s> = SiO2<s>"
add_reaction model=etcher_cf3 name=4_18_SiO2_CF2 \
    expression="CF3<g> + SiO2_CF2<s> = SiO2<s>"
finalize_model model=etcher_cf3

define_model name=etcher_ar \
    description="CF4/CHF3/Ar RIE Etch with Ar"
add_source_species model=etcher_ar name=Ar
add_reaction model=etcher_ar name=Ar_SiO2_reflection \
    expression="Ar<g> + SiO2<s> = Ar<r> + SiO2<s>"
add_reaction model=etcher_ar name=Ar_SiO2_F2_reflection \
    expression="Ar<g> + SiO2_F2<s> = Ar<r> + SiO2_F2<s>"
add_reaction model=etcher_ar name=Ar_SiO2_CF2_reflection \
    expression="Ar<g> + SiO2_CF2<s> = Ar<r> + SiO2_CF2<s>"
add_reaction model=etcher_ar name=sputter_SiO2 \
    expression="SiO2<s> + Ar<g> = SiO2<v>"
add_reaction model=etcher_ar name=sputter_SiO2_F2 \
    expression="SiO2_F2<s> + Ar<g> = SiO2_F2<v>"
add_reaction model=etcher_ar name=sputter_SiO2_CF2 \
    expression="SiO2_CF2<s> + Ar<g> = SiO2_CF2<v>"
finalize_model model=etcher_ar

# Define etch machines for each species distribution and reaction properties
# F reactions
define_etch_machine model=etcher_f \
    name=etch_f species_distribution=F_all
define_probability name=prob_4_1_9_SiO2 \
    expression="E > 4. ? 0.012288 : (E > 0.163 ? 0.003955 : 0)"
define_probability name=prob_4_2_42 \
    expression="E > 4. ? 0.11 : 0.01"
define_probability name=prob_4_46_20_SiO2_CF2 \
    expression="E > 4. ? 0.018667 : 0.008667"
define_probability name=prob_4_20 \
    expression="E > 4. ? 0.008667 : 0"
define_probability name=prob_4_9_SiO2_F2 \
    expression="E > 4. ? 0.008333 : 0"

add_reaction_properties reaction=4_1_9_SiO2 \
    machine=etch_f p=0.003955 
add_reaction_properties reaction=4_2_42 \
    machine=etch_f probability=prob_4_2_42
add_reaction_properties reaction=4_9_SiO2_F2 \
    machine=etch_f probability=prob_4_9_SiO2_F2
add_reaction_properties reaction=4_20_SiO2 \
    machine=etch_f probability=prob_4_20
add_reaction_properties reaction=4_46_20_SiO2_CF2 \
    machine=etch_f probability=prob_4_46_20_SiO2_CF2

# CF reactions
define_etch_machine model=etcher_cf \
    name=etch_cf species_distribution=CF_all 
define_probability name=prob_4_5_41_SiO2_F2 \
    expression="E > 4. ? 0.383 : 0.333"
define_probability name=prob_4_8_19_SiO2 \
    expression="E > 4. ? 0.15367 : 0"
define_probability name=prob_4_8_SiO2_F2 \
    expression="E > 4. ? 0.01367 : 0"
define_probability name=prob_4_19_SiO2_CF2 \
    expression="E > 4. ? 0.14 : 0"
define_probability name=prob_4_41_SiO2 \
    expression="E > 4. ? 0.05 : 0"

add_reaction_properties reaction=4_5_SiO2 \
    machine=etch_cf p=0.333
add_reaction_properties reaction=4_5_41_SiO2_F2 \
    machine=etch_cf probability=prob_4_5_41_SiO2_F2
add_reaction_properties reaction=4_8_19_SiO2 \
    machine=etch_cf probability=prob_4_8_19_SiO2
add_reaction_properties reaction=4_8_SiO2_F2 \
    machine=etch_cf probability=prob_4_8_SiO2_F2
add_reaction_properties reaction=4_19_SiO2_CF2 \
    machine=etch_cf probability=prob_4_19_SiO2_CF2
add_reaction_properties reaction=4_41_SiO2 \
    machine=etch_cf probability=prob_4_41_SiO2

# CF2 reactions
define_etch_machine model=etcher_cf2 \
    name=etch_cf2 species_distribution=CF2_all
define_probability name=prob_4_3_40 \
    expression="E > 4. ? 0.86 : 0.66"
define_probability name=prob_4_6_17_SiO2 \
    expression="E > 4. ? 0.02423 : 0"
define_probability name=prob_4_6_SiO2_F2 \
    expression="E > 4. ? 0.022 : 0"
define_probability name=prob_4_17_SiO2_CF2 \
    expression="E > 4. ? 0.00223 : 0"

add_reaction_properties reaction=4_3_40 \
    machine=etch_cf2 probability=prob_4_3_40
add_reaction_properties reaction=4_6_17_SiO2 \
    machine=etch_cf2 probability=prob_4_6_17_SiO2
add_reaction_properties reaction=4_6_SiO2_F2 \
    machine=etch_cf2 probability=prob_4_6_SiO2_F2
add_reaction_properties reaction=4_17_SiO2_CF2 \
    machine=etch_cf2 probability=prob_4_17_SiO2_CF2

# CF3 reactions
define_etch_machine model=etcher_cf3 \
    name=etch_cf3 species_distribution=CF3_all
define_probability name=prob_4_4_39 \
    expression="E > 4. ? 0.1 : 0.05"
define_probability name=prob_4_7_18_SiO2 \
    expression="E > 4. ? 0.06167 : 0"
define_probability name=prob_4_7_SiO2_F2 \
    expression="E > 4. ? 0.03067 : 0"
define_probability name=prob_4_18_SiO2_CF2 \
    expression="E > 4. ? 0.031 : 0"

add_reaction_properties reaction=4_4_39_SiO2_F2 \
    machine=etch_cf3 probability=prob_4_4_39
add_reaction_properties reaction=4_4_39_SiO2_CF2 \
    machine=etch_cf3 probability=prob_4_4_39
add_reaction_properties reaction=4_7_18_SiO2 \
    machine=etch_cf3 probability=prob_4_7_18_SiO2
add_reaction_properties reaction=4_7_SiO2_F2 \
    machine=etch_cf3 probability=prob_4_7_SiO2_F2
add_reaction_properties reaction=4_18_SiO2_CF2 \
    machine=etch_cf3 probability=prob_4_18_SiO2_CF2

# Ar reflections and sputtering
define_etch_machine model=etcher_ar \
    name=etch_ar species_distribution=Ar_all
define_probability name=p_reflection \
    expression="(theta > M_PI / 3.) ? 3.6 * \
    pow(theta - M_PI / 3., 2.) : 0"
define_probability name=p_sputter \
    expression="E > 50 ? (0.0003667 * E - 0.0183333) \
    * pow(cos(theta), -2.08) * exp(0.37 - (0.37 / cos(theta))) : 0"
define_probability name=p_sputter_polymer \
    expression="E > 65 ? (0.0003667 * E - 0.0183333) \
    * pow(cos(theta), -2.08) * exp(0.37 - (0.37 / cos(theta))) : 0"

add_reaction_properties machine=etch_ar \
    reaction=Ar_SiO2_reflection probability=p_reflection
add_reaction_properties machine=etch_ar \
    reaction=Ar_SiO2_F2_reflection probability=p_reflection
add_reaction_properties machine=etch_ar \
    reaction=Ar_SiO2_CF2_reflection probability=p_reflection

add_reaction_properties machine=etch_ar \
    probability=p_sputter reaction=sputter_SiO2
add_reaction_properties machine=etch_ar \
    probability=p_sputter_polymer reaction=sputter_SiO2_F2 
add_reaction_properties machine=etch_ar \
    probability=p_sputter_polymer reaction=sputter_SiO2_CF2

# Create structure to etch
define_structure material=Pt point_min={0 0 0} \
    point_max={$MASK_XSIZE_UM $MASK_YSIZE_UM 0.1}

# Deposit oxide
define_deposit_machine anisotropy=0.8 curvature=0 \
    material=SiO2 model=simple rate=1
deposit spacing=0.1 time=0.1

# Ideal unetched e-beam resist mask
define_layout name=maskholelayout cell=TOP \
    layout_file=$MASK_HOLE_PATH scale=1 domain_min= {0 0} \
    domain_max= {$MASK_XSIZE_UM $MASK_YSIZE_UM} \
    layer_names= {maskhole} layer_numbers= {1:0} \
    shift_to_origin=false
define_mask name=mask1 layout=maskholelayout \
    domain=SIM3D layer=maskhole
pattern mask=mask1 material=Resist accuracy=0.001 \
    thickness=0.1 type=dark_positive
save

# Etch hole over time intervals using each source species
for {set i 0} {$i < $N_ETCH_INTERVALS} {incr i} {
    etch machine=etch_ar method=pmc time=$ETCH_INTERVAL_MIN \
        spacing= [list "$GRID_SIZE_UM" "$GRID_SIZE_UM" "$GRID_SIZE_UM"] 
    etch machine=etch_f method=pmc time=$ETCH_INTERVAL_MIN \
        spacing= [list "$GRID_SIZE_UM" "$GRID_SIZE_UM" "$GRID_SIZE_UM"] 
    etch machine=etch_cf method=pmc time=$ETCH_INTERVAL_MIN \
        spacing= [list "$GRID_SIZE_UM" "$GRID_SIZE_UM" "$GRID_SIZE_UM"] 
    etch machine=etch_cf2 method=pmc time=$ETCH_INTERVAL_MIN \
        spacing= [list "$GRID_SIZE_UM" "$GRID_SIZE_UM" "$GRID_SIZE_UM"] 
    etch machine=etch_cf3 method=pmc time=$ETCH_INTERVAL_MIN \
        spacing= [list "$GRID_SIZE_UM" "$GRID_SIZE_UM" "$GRID_SIZE_UM"] 
}
save
