# Plasma model for CF4/CHF3/Ar ICP/RIE etch

# Options for saving species distributions
set SAVE_DISTRIBUTIONS false
set F_SD_PATH output_files/f_sd.txt
set CF_SD_PATH output_files/cf_sd.txt
set CF2_SD_PATH output_files/cf2_sd.txt
set CF3_SD_PATH output_files/cf3_sd.txt
set CHF_SD_PATH output_files/chf_sd.txt
set CHF2_SD_PATH output_files/chf2_sd.txt
set H_SD_PATH output_files/h_sd.txt
set H2_SD_PATH output_files/h2_sd.txt
set AR_SD_PATH output_files/ar_sd.txt

# Define plasma model
define_plasma_model name=plasma \
    bulk_model_type=global sheath_model_type=circuit

# Add bulk reactions
if {$CF4_SCCM > 0 || $CHF3_SCCM > 0} {
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
    lappend GAS_FLOWS [list "CF4 $CF4_SCCM<sccm>"]
    source gas_reactions/cf4.tcl
}
if {$CHF3_SCCM > 0} {
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
    lappend GAS_FLOWS [list "CHF3 $CHF3_SCCM<sccm>"]
    source gas_reactions/chf3.tcl
}
if {$AR_SCCM > 0} {
    add_species plasma_model=plasma name=Ar    mass=39.948<amu> charge=0
    add_species plasma_model=plasma name=Ar+   mass=39.948<amu> charge=+1
    lappend GAS_FLOWS [list "Ar $AR_SCCM<sccm>"]
    source gas_reactions/ar.tcl
}

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

# Get angle and energy distributions for each species
if {$CF4_SCCM > 0 || $CHF3_SCCM > 0} {
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
    
    if {$SAVE_DISTRIBUTIONS} {
        save species_distribution=F_all \
            species=F file_type=text file=$F_SD_PATH
        save species_distribution=CF_all \
            species=CF file_type=text file=$CF_SD_PATH
        save species_distribution=CF2_all \
            species=CF2 file_type=text file=$CF2_SD_PATH
        save species_distribution=CF3_all \
            species=CF3 file_type=text file=$CF3_SD_PATH
    }
}
if {$CHF3_SCCM > 0} {
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

    if {$SAVE_DISTRIBUTIONS} {
        save species_distribution=CHF_all \
            species=CHF file_type=text file=$CHF_SD_PATH
        save species_distribution=CHF2_all \
            species=CHF2 file_type=text file=$CHF2_SD_PATH
        save species_distribution=H_all \
            species=H file_type=text file=$H_SD_PATH
        save species_distribution=H2_all \
            species=H2 file_type=text file=$H2_SD_PATH
    }
}
if {$AR_SCCM > 0} {
    define_species_distribution type=plasma solution=plasma_sol \
        name=Ar+ species=Ar+ 
    define_species_distribution type=plasma solution=plasma_sol \
        name=Ar species=Ar  
    define_species_distribution type=sum name=Ar_all species=Ar \
        distributions= {{Ar+ Ar+} {Ar Ar}}

    if {$SAVE_DISTRIBUTIONS} {
        save species_distribution=Ar_all \
            species=Ar file_type=text file=$AR_SD_PATH
    }
}
