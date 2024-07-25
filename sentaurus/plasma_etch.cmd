# Etch SiO2 using reaction model and plasma data

# Reaction set from Ho et. al. 
# "Chemical reaction Mechanisms for Modeling the Fluorocarbon
#  Plasma Etch of Silicon Oxide and Related Materials"

# Etch settings
set GRID_SIZE_UM 0.002
set ETCH_INTERVAL_MIN 0.1
set N_ETCH_INTERVALS 1
set MASK_XSIZE_UM 0.1
set MASK_YSIZE_UM 0.1
set NEUTRALIZED_EV 1

# Input files
set F_SD_PATH f_sd.txt
set CF_SD_PATH cf_sd.txt
set CF2_SD_PATH cf2_sd.txt
set CF3_SD_PATH cf3_sd.txt
set X_SD_PATH x_sd.txt
set MASK_HOLE_PATH maskhole50nm.gds

# Define model
define_model name=etcher description="CF4/CHF3/Ar/O2 ICP/RIE Etch Model"
define_species_distribution type=ead_file file=$F_SD_PATH \
    name=F_all species=F
define_species_distribution type=ead_file file=$CF_SD_PATH \
    name=CF_all species=CF
define_species_distribution type=ead_file file=$CF2_SD_PATH \
    name=CF2_all species=CF2
define_species_distribution type=ead_file file=$CF3_SD_PATH \
    name=CF3_all species=CF3
define_species_distribution type=ead_file file=$X_SD_PATH \
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
# F reactions & sputtering 
add_reaction model=etcher name=4_1 \
    expression="F<g> + SiO2<s> = SiF4<v> + O2<v>"
add_reaction model=etcher name=4_2 \
    expression="F<g> + SiO2<s> = SiO2_F2<s>"
add_reaction model=etcher name=4_9_SiO2 \
    expression="F<g> + SiO2<s> = SiF4<v> + O2<v> + F<g>"
add_reaction model=etcher name=4_9_SiO2_F2 \
    expression="F<g> + SiO2_F2<s> = SiO2<s> + F<g>"
add_reaction model=etcher name=4_20_SiO2 \
    expression="F<g> + SiO2_CF2<s> = SiF4<v> + F<g>"
add_reaction model=etcher name=4_20_SiO2_CF2 \
    expression="F<g> + SiO2_CF2<s> = SiO2<s> + CO<v> + F<g>"
add_reaction model=etcher name=4_31 \
    expression="F<g> + SiO2<s> = F<g> + SiO2<s>"
add_reaction model=etcher name=4_42 \
    expression="F<g> + SiO2<s> = SiO2_F2<s>"
add_reaction model=etcher name=4_46 \
    expression="F<g> + SiO2_CF2<s> = SiO2<s> + CF4<v>"
add_reaction model=etcher name=F_SiO2_sputter \
    expression="F<g> + SiO2<s> = SiO2<q> + F<r>"
add_reaction model=etcher name=F_SiO2_F2_sputter \
    expression="F<g> + SiO2_F2<s> = SiO2_F2<q> + F<r>"
add_reaction model=etcher name=F_SiO2_CF2_sputter \
    expression="F<g> + SiO2_CF2<s> = SiO2_CF2<q> + F<r>"

# CF reactions & sputtering
add_reaction model=etcher name=4_5_SiO2 \
    expression="CF<g> + SiO2<s> = SiO2_CF2<s>"
add_reaction model=etcher name=4_5_SiO2_F2 \
    expression="CF<g> + SiO2_F2<s> = SiO2_CF2<s>"
add_reaction model=etcher name=4_8_SiO2 \
    expression="CF<g> + SiO2<s> = SiF4<v> + O2<v> + CF<g>"
add_reaction model=etcher name=4_8_SiO2_F2 \
    expression="CF<g> + SiO2_F2<s> = SiO2<s> + CF<g>"
add_reaction model=etcher name=4_19_SiO2 \
    expression="CF<g> + SiO2<s> = SiF4<v> + CF<g>"
add_reaction model=etcher name=4_19_SiO2_CF2 \
    expression="CF<g> + SiO2_CF2<s> = SiO2<s> + CO<v> + CF<g>"
add_reaction model=etcher name=4_30 \
    expression="CF<g> + SiO2<s> = CF<g> + SiO2<s>"
add_reaction model=etcher name=4_41_SiO2 \
    expression="CF<g> + SiO2<s> = SiO2_F2<s>"
add_reaction model=etcher name=4_41_SiO2_F2 \
    expression="CF<g> + SiO2_F2<s> = SiO2_CF2<s>"
add_reaction model=etcher name=CF_SiO2_sputter \
    expression="CF<g> + SiO2<s> = SiO2<q> + CF<r>"
add_reaction model=etcher name=CF_SiO2_F2_sputter \
    expression="CF<g> + SiO2_F2<s> = SiO2_F2<q> + CF<r>"
add_reaction model=etcher name=CF_SiO2_CF2_sputter \
    expression="CF<g> + SiO2_CF2<s> = SiO2_CF2<q> + CF<r>"

# CF2 reactions & sputtering
add_reaction model=etcher name=4_3 \
    expression="CF2<g> + SiO2<s> = SiO2_CF2<s>"
add_reaction model=etcher name=4_6_SiO2 \
    expression="CF2<g> + SiO2<s> = SiF4<v> + O2<v> + CF2<g>"
add_reaction model=etcher name=4_6_SiO2_F2 \
    expression="CF2<g> + SiO2_F2<s> = SiO2<s>"
add_reaction model=etcher name=4_17_SiO2 \
    expression="CF2<g> + SiO2<s> = SiF4<v> + CO<v> + CF2<g>"
add_reaction model=etcher name=4_17_SiO2_CF2 \
    expression="CF2<g> + SiO2_CF2<s> = SiO2<s>"
add_reaction model=etcher name=4_29 \
    expression="CF2<g> + SiO2<s> = CF2<g> + SiO2<s>"
add_reaction model=etcher name=4_40 \
    expression="CF2<g> + SiO2<s> = SiO2_CF2<s>"
add_reaction model=etcher name=CF2_SiO2_sputter \
    expression="CF2<g> + SiO2<s> = SiO2<q> + CF2<r>"
add_reaction model=etcher name=CF2_SiO2_F2_sputter \
    expression="CF2<g> + SiO2_F2<s> = SiO2_F2<q> + CF2<r>"
add_reaction model=etcher name=CF2_SiO2_CF2_sputter \
    expression="CF2<g> + SiO2_CF2<s> = SiO2_CF2<q> + CF2<r>"

# CF3 reactions & sputtering
add_reaction model=etcher name=4_4_SiO2_F2 \
    expression="CF3<g> + SiO2<s> = SiO2_F2<s>"
add_reaction model=etcher name=4_4_SiO2_CF2 \
    expression="CF3<g> + SiO2<s> = SiO2_CF2<s>"
add_reaction model=etcher name=4_7_SiO2 \
    expression="CF3<g> + SiO2<s> = SiF4<v> + O2<v> + CF3<g>"
add_reaction model=etcher name=4_7_SiO2_F2 \
    expression="CF3<g> + SiO2_F2<s> = SiO2<s>"
add_reaction model=etcher name=4_18_SiO2 \
    expression="CF3<g> + SiO2<s> = SiF4<v> + CF3<g>"
add_reaction model=etcher name=4_18_SiO2_CF2 \
    expression="CF3<g> + SiO2_CF2<s> = SiO2<s> + CO<v>"
add_reaction model=etcher name=4_28 \
    expression="CF3<g> + SiO2<s> = CF3<g> + SiO2<s>"
add_reaction model=etcher name=4_39_SiO2_F2 \
    expression="CF3<g> + SiO2<s> = SiO2_F2<s>"
add_reaction model=etcher name=4_39_SiO2_CF2 \
    expression="CF3<g> + SiO2<s> = SiO2_CF2<s>"
add_reaction model=etcher name=CF3_SiO2_sputter \
    expression="CF3<g> + SiO2<s> = SiO2<q> + CF3<r>"
add_reaction model=etcher name=CF3_SiO2_F2_sputter \
    expression="CF3<g> + SiO2_F2<s> = SiO2_F2<q> + CF3<r>"
add_reaction model=etcher name=CF3_SiO2_CF2_sputter \
    expression="CF3<g> + SiO2_CF2<s> = SiO2_CF2<q> + CF3<r>"

# Sputtering with non-reacting ions "X"
add_reaction model=etcher name=sputter_SiO2 \
    expression="SiO2<s> + X<g> = SiO2<q> + X<q>"
add_reaction model=etcher name=sputter_SiO2_F2 \
    expression="SiO2_F2<s> + X<g> = SiO2_F2<q> + X<q>"
add_reaction model=etcher name=sputter_SiO2_CF2 \
    expression="SiO2_CF2<s> + X<g> = SiO2_CF2<q> + X<q>"
finalize_model model=etcher

# Define etch machines for each species distribution and reaction properties
define_etch_machine model=etcher name=etch_f species_distribution=F_all
add_reaction_properties reaction=4_1 machine=etch_f \
    activation_energy=0.163<eV> p=3.955e-3
add_reaction_properties reaction=4_2 machine=etch_f p=0.01
add_reaction_properties reaction=4_9_SiO2 machine=etch_f p=8.333e-3 \
    energy_exponent=0.5 energy_threshold=4<eV> energy_reference=9<eV> \
    product_energy_max=$NEUTRALIZED_EV
add_reaction_properties reaction=4_9_SiO2_F2 machine=etch_f p=8.333e-3 \
    energy_exponent=0.5 energy_threshold=4<eV> energy_reference=9<eV> 
add_reaction_properties reaction=4_20_SiO2 machine=etch_f p=8.667e-3 \
    energy_exponent=0.5 energy_threshold=4<eV> energy_reference=9<eV> \
    product_energy_max=$NEUTRALIZED_EV
add_reaction_properties reaction=4_20_SiO2_CF2 machine=etch_f p=8.667e-3 \
    energy_exponent=0.5 energy_threshold=4<eV> energy_reference=9<eV> 
add_reaction_properties reaction=4_31 machine=etch_f \
    p=0.8 energy_threshold=4<eV> product_energy_max=$NEUTRALIZED_EV
add_reaction_properties reaction=4_42 machine=etch_f \
    p=0.1 energy_threshold=4<eV> product_energy_max=$NEUTRALIZED_EV
add_reaction_properties reaction=4_42 machine=etch_f \
    p=5e-3 energy_threshold=4<eV>
add_reaction_properties machine=etch_f \
    reaction=F_SiO2_sputter energy_threshold=50<eV>
add_reaction_properties machine=etch_f \
    reaction=F_SiO2_F2_sputter energy_threshold=65<eV>
add_reaction_properties machine=etch_f \
    reaction=F_SiO2_CF2_sputter energy_threshold=65<eV>

define_etch_machine model=etcher name=etch_cf species_distribution=CF_all
add_reaction_properties reaction=4_5_SiO2 machine=etch_cf p=0.333
add_reaction_properties reaction=4_5_SiO2_F2 machine=etch_cf p=0.333
add_reaction_properties reaction=4_8_SiO2 machine=etch_cf p=1.367e-2 \
    energy_exponent=0.5 energy_threshold=4<eV> energy_reference=9<eV> \
    product_energy_max=$NEUTRALIZED_EV
add_reaction_properties reaction=4_8_SiO2_F2 machine=etch_cf p=1.367e-2 \
    energy_exponent=0.5 energy_threshold=4<eV> energy_reference=9<eV> 
add_reaction_properties reaction=4_19_SiO2 machine=etch_cf p=0.14 \
    energy_exponent=0.5 energy_threshold=4<eV> energy_reference=9<eV> \
    product_energy_max=$NEUTRALIZED_EV
add_reaction_properties reaction=4_19_SiO2_CF2 machine=etch_cf p=0.14 \
    energy_exponent=0.5 energy_threshold=4<eV> energy_reference=9<eV> 
add_reaction_properties reaction=4_30 machine=etch_cf \
    p=0.8 energy_threshold=4<eV> product_energy_max=$NEUTRALIZED_EV
add_reaction_properties reaction=4_41_SiO2 machine=etch_cf \
    p=0.05 energy_threshold=4<eV> 
add_reaction_properties reaction=4_41_SiO2_F2 machine=etch_cf \
    p=0.05 energy_threshold=4<eV>
add_reaction_properties machine=etch_cf \
    reaction=CF_SiO2_sputter energy_threshold=50<eV>
add_reaction_properties machine=etch_cf \
    reaction=CF_SiO2_F2_sputter energy_threshold=65<eV>
add_reaction_properties machine=etch_cf \
    reaction=CF_SiO2_CF2_sputter energy_threshold=65<eV>

define_etch_machine model=etcher name=etch_cf2 species_distribution=CF2_all
add_reaction_properties reaction=4_3 machine=etch_cf2 p=0.66
add_reaction_properties reaction=4_6_SiO2 machine=etch_cf2 p=0.022 \
    energy_exponent=0.5 energy_threshold=4<eV> energy_reference=9<eV> \
    product_energy_max=$NEUTRALIZED_EV
add_reaction_properties reaction=4_6_SiO2_F2 machine=etch_cf2 p=0.022 \
    energy_exponent=0.5 energy_threshold=4<eV> energy_reference=9<eV> 
add_reaction_properties reaction=4_17_SiO2 machine=etch_cf2 p=2.23e-3 \
    energy_exponent=0.5 energy_threshold=4<eV> energy_reference=9<eV> \
    product_energy_max=$NEUTRALIZED_EV
add_reaction_properties reaction=4_17_SiO2_CF2 machine=etch_cf2 p=2.23e-3 \
    energy_exponent=0.5 energy_threshold=4<eV> energy_reference=9<eV> 
add_reaction_properties reaction=4_29 machine=etch_cf2 \
    p=0.8 energy_threshold=4<eV> product_energy_max=$NEUTRALIZED_EV
add_reaction_properties reaction=4_40 machine=etch_cf2 \
    p=0.2 energy_threshold=4<eV>
add_reaction_properties machine=etch_cf2 \
    reaction=CF2_SiO2_sputter energy_threshold=50<eV>
add_reaction_properties machine=etch_cf2 \
    reaction=CF2_SiO2_F2_sputter energy_threshold=65<eV>
add_reaction_properties machine=etch_cf2 \
    reaction=CF2_SiO2_CF2_sputter energy_threshold=65<eV>

define_etch_machine model=etcher name=etch_cf3 species_distribution=CF3_all
add_reaction_properties reaction=4_4_SiO2 machine=etch_cf3 p=0.05
add_reaction_properties reaction=4_4_SiO2_F2 machine=etch_cf3 p=0.05
add_reaction_properties reaction=4_7_SiO2 machine=etch_cf3 p=3.067e-2 \
    energy_exponent=0.5 energy_threshold=4<eV> energy_reference=9<eV> \
    product_energy_max=$NEUTRALIZED_EV
add_reaction_properties reaction=4_7_SiO2_F2 machine=etch_cf3 p=3.067e-2 \
    energy_exponent=0.5 energy_threshold=4<eV> energy_reference=9<eV> 
add_reaction_properties reaction=4_18_SiO2 machine=etch_cf3 p=0.031 \
    energy_exponent=0.5 energy_threshold=4<eV> energy_reference=9<eV> \
    product_energy_max=$NEUTRALIZED_EV
add_reaction_properties reaction=4_18_SiO2_CF2 machine=etch_cf3 p=0.031 \
    energy_exponent=0.5 energy_threshold=4<eV> energy_reference=9<eV> 
add_reaction_properties reaction=4_28 machine=etch_cf3 \
    p=0.8 energy_threshold=4<eV> product_energy_max=$NEUTRALIZED_EV
add_reaction_properties reaction=4_39_SiO2_F2 machine=etch_cf3 \
    p=0.05 energy_threshold=4<eV>
add_reaction_properties reaction=4_39_SiO2_CF2 machine=etch_cf3 \
    p=0.05 energy_threshold=4<eV>
add_reaction_properties machine=etch_cf3 \
    reaction=CF3_SiO2_sputter energy_threshold=50<eV>
add_reaction_properties machine=etch_cf3 \
    reaction=CF3_SiO2_F2_sputter energy_threshold=65<eV>
add_reaction_properties machine=etch_cf3 \
    reaction=CF3_SiO2_CF2_sputter energy_threshold=65<eV>

define_etch_machine model=etcher name=etch_x
add_reaction_properties machine=etch_x \
    reaction=sputter_SiO2 machine=etch_x energy_threshold=18<eV>
add_reaction_properties machine=etch_x \
    reaction=sputter_SiO2_F2 energy_threshold=65<eV>
add_reaction_properties machine=etch_x \
    reaction=sputter_SiO2_CF2 energy_threshold=65<eV>

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
    etch machine=etch_f method=pmc time=$ETCH_INTERVAL_MIN \
        spacing= {$GRID_SIZE_UM $GRID_SIZE_UM $GRID_SIZE_UM} 
    #etch machine=etch_cf method=pmc time=$ETCH_INTERVAL_MIN \
    #    spacing= {$GRID_SIZE_UM $GRID_SIZE_UM $GRID_SIZE_UM} 
    #etch machine=etch_cf2 method=pmc time=$ETCH_INTERVAL_MIN \
    #    spacing= {$GRID_SIZE_UM $GRID_SIZE_UM $GRID_SIZE_UM} 
    #etch machine=etch_cf3 method=pmc time=$ETCH_INTERVAL_MIN \
    #    spacing= {$GRID_SIZE_UM $GRID_SIZE_UM $GRID_SIZE_UM} 
    #etch machine=etch_x method=pmc time=$ETCH_INTERVAL_MIN \
    #    spacing= {$GRID_SIZE_UM $GRID_SIZE_UM $GRID_SIZE_UM} 
}
save
