# Etch SiO2 using reaction model 

# Options for loading species distributions from file
set DISTRIBUTIONS_FROM_FILE = false
set F_SD_PATH ../output_files/f_sd.txt
set CF_SD_PATH ../output_files/cf_sd.txt
set CF2_SD_PATH ../output_files/cf2_sd.txt
set CF3_SD_PATH ../output_files/cf3_sd.txt
set CHF_SD_PATH ../output_files/chf_sd.txt
set CHF2_SD_PATH ../output_files/chf2_sd.txt
set H_SD_PATH ../output_files/h_sd.txt
set H2_SD_PATH ../output_files/h2_sd.txt
set AR_SD_PATH ../output_files/ar_sd.txt

if ($DISTRIBUTIONS_FROM_FILE){
    if ($CF4_SCCM > 0 || $CHF3_SCCM > 0) {
        define_species_distribution type=ead_file file=$F_SD_PATH \
            name=F_all species=F 
        define_species_distribution type=ead_file file=$CF_SD_PATH \
            name=CF_all species=CF 
        define_species_distribution type=ead_file file=$CF2_SD_PATH \
            name=CF2_all species=CF2 
        define_species_distribution type=ead_file file=$CF3_SD_PATH \
            name=CF3_all species=CF3 
    }
    if ($CHF3_SCCM > 0) {
        define_species_distribution type=ead_file file=$CHF_SD_PATH \
            name=CHF_all species=CHF 
        define_species_distribution type=ead_file file=$CHF2_SD_PATH \
            name=CHF2_all species=CHF2 
        define_species_distribution type=ead_file file=$H_SD_PATH \
            name=H_all species=H 
        define_species_distribution type=ead_file file=$H2_SD_PATH \
            name=H2_all species=H2 
    }
    if ($AR_SCCM > 0) {
        define_species_distribution type=ead_file file=$AR_SD_PATH \
            name=Ar_all species=Ar 
    }
}

# Create substrate layer
define_structure material=Pt point_min={0 0 0} \
    point_max={$MASK_XSIZE_UM $MASK_YSIZE_UM 0.1}

# Deposit SiO2
define_deposit_machine anisotropy=0.8 curvature=0 \
    material=SiO2 model=simple rate=1
deposit spacing=0.1 time=$SIO2_UM

# Ideal hardmask
define_layout name=maskholelayout cell=TOP \
    layout_file=$MASK_HOLE_PATH scale=1 domain_min= {0 0} \
    domain_max= {$MASK_XSIZE_UM $MASK_YSIZE_UM} \
    layer_names= {maskhole} layer_numbers= {1:0} \
    shift_to_origin=false
define_mask name=mask1 layout=maskholelayout \
    domain=SIM3D layer=maskhole
pattern mask=mask1 material=Resist accuracy=0.001 \
    thickness=0.1 type=dark_positive
save file="$OUTPUT_PATH"

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
    etch machine=etch_chf method=pmc time=$ETCH_INTERVAL_MIN \
        spacing= [list "$GRID_SIZE_UM" "$GRID_SIZE_UM" "$GRID_SIZE_UM"] 
    etch machine=etch_chf2 method=pmc time=$ETCH_INTERVAL_MIN \
        spacing= [list "$GRID_SIZE_UM" "$GRID_SIZE_UM" "$GRID_SIZE_UM"] 
    etch machine=etch_h method=pmc time=$ETCH_INTERVAL_MIN \
        spacing= [list "$GRID_SIZE_UM" "$GRID_SIZE_UM" "$GRID_SIZE_UM"] 
    etch machine=etch_h2 method=pmc time=$ETCH_INTERVAL_MIN \
        spacing= [list "$GRID_SIZE_UM" "$GRID_SIZE_UM" "$GRID_SIZE_UM"] 
    save file="$OUTPUT_PATH"
}
