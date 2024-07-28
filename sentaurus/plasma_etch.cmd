# Etch SiO2 using reaction model and plasma data

# Reaction set from Ho et. al. 
# "Chemical reaction Mechanisms for Modeling the Fluorocarbon
#  Plasma Etch of Silicon Oxide and Related Materials"

# Etch settings
set GRID_SIZE_UM 0.002
set ETCH_INTERVAL_MIN 0.1
set N_ETCH_INTERVALS 5
set MASK_XSIZE_UM 0.1
set MASK_YSIZE_UM 0.1

# Input files
set F_SD_PATH f_sd.txt
set CF_SD_PATH cf_sd.txt
set CF2_SD_PATH cf2_sd.txt
set CF3_SD_PATH cf3_sd.txt
set CHF_SD_PATH chf_sd.txt
set CHF2_SD_PATH chf2_sd.txt
set H_SD_PATH h_sd.txt
set H2_SD_PATH h2_sd.txt
set AR_SD_PATH ar_sd.txt
set MASK_HOLE_PATH maskhole50nm.gds

# Extract species distributions
define_species_distribution type=ead_file file=$F_SD_PATH \
    name=F_all species=F 
define_species_distribution type=ead_file file=$CF_SD_PATH \
    name=CF_all species=CF 
define_species_distribution type=ead_file file=$CF2_SD_PATH \
    name=CF2_all species=CF2 
define_species_distribution type=ead_file file=$CF3_SD_PATH \
    name=CF3_all species=CF3 
define_species_distribution type=ead_file file=$AR_SD_PATH \
    name=Ar_all species=Ar 
define_species_distribution type=ead_file file=$CHF_SD_PATH \
    name=CHF_all species=CHF 
define_species_distribution type=ead_file file=$CHF2_SD_PATH \
    name=CHF2_all species=CHF2 
define_species_distribution type=ead_file file=$H_SD_PATH \
    name=H_all species=H 
define_species_distribution type=ead_file file=$H2_SD_PATH \
    name=H2_all species=H2 

# Do not isotropically reemit non-reacting particles
define_species_properties name=sp_F species=F default_event=discard
define_species_properties name=sp_CF species=CF default_event=discard
define_species_properties name=sp_CF2 species=CF2 default_event=discard
define_species_properties name=sp_CF3 species=CF3 default_event=discard
define_species_properties name=sp_Ar species=Ar default_event=discard
define_species_properties name=sp_CHF species=CHF default_event=discard
define_species_properties name=sp_CHF2 species=CHF2 default_event=discard
define_species_properties name=sp_H species=F default_event=discard
define_species_properties name=sp_H2 species=F default_event=discard

# Define reaction models
define_model name=etcher_f \
    description="CF4/CHF3/Ar RIE Etch Model with F"
add_source_species model=etcher_f name=F
add_reaction model=etcher_f name=f1 \
    expression="F<g> + SiO2<s> = SiO2_F2<s>"
add_reaction model=etcher_f name=f2 \
    expression="F<g> + SiO2_F2<s> = SiF4<v>"
add_reaction model=etcher_f name=f3 \
    expression="F<g> + SiO2_F2<s> = SiO2<s>"
add_reaction model=etcher_f name=f4 \
    expression="F<g> + SiO2_CF2<s> = SiF4<v>"
add_reaction model=etcher_f name=f5 \
    expression="F<g> + SiO2_CF2<s> = SiO2<s>"
add_reaction model=etcher_f name=f6 \
    expression="F<g> + SiO2_H<s> = SiO2<s>"
finalize_model model=etcher_f

define_model name=etcher_cf \
    description="CF4/CHF3/Ar RIE Etch Model with CF"
add_source_species model=etcher_cf name=CF
add_reaction model=etcher_cf name=cf1 \
    expression="CF<g> + SiO2<s> = SiO2_F2<s>"
add_reaction model=etcher_cf name=cf2 \
    expression="CF<g> + SiO2<s> = SiO2_CF2<s>"
add_reaction model=etcher_cf name=cf3 \
    expression="CF<g> + SiO2_F2<s> = SiO2_CF2<s>"
add_reaction model=etcher_cf name=cf4 \
    expression="CF<g> + SiO2_F2<s> = SiF4<v>"
add_reaction model=etcher_cf name=cf5 \
    expression="CF<g> + SiO2_F2<s> = SiO2<s>"
add_reaction model=etcher_cf name=cf6 \
    expression="CF<g> + SiO2_CF2<s> = SiF4<v>"
add_reaction model=etcher_cf name=cf7 \
    expression="CF<g> + SiO2_CF2<s> = SiO2<s>"
add_reaction model=etcher_cf name=cf8 \
    expression="CF<g> + SiO2_H<s> = SiF4<v>"
add_reaction model=etcher_cf name=cf9 \
    expression="CF<g> + SiO2_H<s> = SiO2<s>"
finalize_model model=etcher_cf

define_model name=etcher_cf2 \
    description="CF4/CHF3/Ar RIE Etch Model with CF2"
add_source_species model=etcher_cf2 name=CF2
add_reaction model=etcher_cf2 name=cf21 \
    expression="CF2<g> + SiO2<s> = SiO2_CF2<s>"
add_reaction model=etcher_cf2 name=cf22 \
    expression="CF2<g> + SiO2_F2<s> = SiF4<v>"
add_reaction model=etcher_cf2 name=cf23 \
    expression="CF2<g> + SiO2_F2<s> = SiO2<s>"
add_reaction model=etcher_cf2 name=cf24 \
    expression="CF2<g> + SiO2_CF2<s> = SiF4<v>"
add_reaction model=etcher_cf2 name=cf25 \
    expression="CF2<g> + SiO2_CF2<s> = SiO2<s>"
add_reaction model=etcher_cf2 name=cf26 \
    expression="CF2<g> + SiO2_H<s> = SiF4<v>"
add_reaction model=etcher_cf2 name=cf27 \
    expression="CF2<g> + SiO2_H<s> = SiO2<s>"
finalize_model model=etcher_cf2

define_model name=etcher_cf3 \
    description="CF4/CHF3/Ar RIE Etch Model with CF3"
add_source_species model=etcher_cf3 name=CF3
add_reaction model=etcher_cf3 name=cf31 \
    expression="CF3<g> + SiO2<s> = SiO2_F2<s>"
add_reaction model=etcher_cf3 name=cf32 \
    expression="CF3<g> + SiO2<s> = SiO2_CF2<s>"
add_reaction model=etcher_cf3 name=cf33 \
    expression="CF3<g> + SiO2_F2<s> = SiF4<v>"
add_reaction model=etcher_cf3 name=cf34 \
    expression="CF3<g> + SiO2_F2<s> = SiO2<s>"
add_reaction model=etcher_cf3 name=cf35 \
    expression="CF3<g> + SiO2_CF2<s> = SiF4<v>"
add_reaction model=etcher_cf3 name=cf36 \
    expression="CF3<g> + SiO2_CF2<s> = SiO2<s>"
add_reaction model=etcher_cf3 name=cf37 \
    expression="CF3<g> + SiO2_H<s> = SiF4<v>"
add_reaction model=etcher_cf3 name=cf38 \
    expression="CF3<g> + SiO2_H<s> = SiO2<s>"
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
add_reaction model=etcher_ar name=Ar_SiO2_H_reflection \
    expression="Ar<g> + SiO2_H<s> = Ar<r> + SiO2_H<s>"
add_reaction model=etcher_ar name=sputter_SiO2 \
    expression="SiO2<s> + Ar<g> = SiO2<v>"
add_reaction model=etcher_ar name=sputter_SiO2_F2 \
    expression="SiO2_F2<s> + Ar<g> = SiO2_F2<v>"
add_reaction model=etcher_ar name=sputter_SiO2_CF2 \
    expression="SiO2_CF2<s> + Ar<g> = SiO2_CF2<v>"
add_reaction model=etcher_ar name=sputter_SiO2_H \
    expression="SiO2_H<s> + Ar<g> = SiO2_H<v>"
finalize_model model=etcher_ar

define_model name=etcher_h \
    description="CF4/CHF3/Ar RIE Etch Model with H"
add_source_species model=etcher_h name=H
add_reaction model=etcher_h name=h1 \
    expression="H<g> + SiO2<s> = SiO2_H<s>"
add_reaction model=etcher_h name=h2 \
    expression="H<g> + SiO2_H<s> = SiF4<v>"
add_reaction model=etcher_h name=h3 \
    expression="H<g> + SiO2_H<s> = SiO2<s>"
add_reaction model=etcher_h name=h4 \
    expression="H<g> + SiO2_F2<s> = SiF4<v>"
add_reaction model=etcher_h name=h5 \
    expression="H<g> + SiO2_F2<s> = SiO2<s>"
add_reaction model=etcher_h name=h6 \
    expression="H<g> + SiO2_CF2<s> = SiF4<v>"
add_reaction model=etcher_h name=h7 \
    expression="H<g> + SiO2_CF2<s> = SiO2<s>"
finalize_model model=etcher_h

define_model name=etcher_h2 \
    description="CF4/CHF3/Ar RIE Etch Model with H2"
add_source_species model=etcher_h2 name=H2
add_reaction model=etcher_h2 name=h21 \
    expression="H2<g> + SiO2_H<s> = SiF4<v>"
add_reaction model=etcher_h2 name=h22 \
    expression="H2<g> + SiO2_H<s> = SiO2<s>"
add_reaction model=etcher_h2 name=h23 \
    expression="H2<g> + SiO2_F2<s> = SiF4<v>"
add_reaction model=etcher_h2 name=h24 \
    expression="H2<g> + SiO2_F2<s> = SiO2<s>"
add_reaction model=etcher_h2 name=h25 \
    expression="H2<g> + SiO2_CF2<s> = SiF4<v>"
add_reaction model=etcher_h2 name=h26 \
    expression="H2<g> + SiO2_CF2<s> = SiO2<s>"
finalize_model model=etcher_h2

define_model name=etcher_chf \
    description="CF4/CHF3/Ar RIE Etch Model with CHF"
add_source_species model=etcher_chf name=CHF
add_reaction model=etcher_chf name=chf1 \
    expression="CHF<g> + SiO2<s> = SiO2_F2<s>"
add_reaction model=etcher_chf name=chf2 \
    expression="CHF<g> + SiO2<s> = SiO2_H<s>"
add_reaction model=etcher_chf name=chf3 \
    expression="CHF<g> + SiO2_H<s> = SiF4<v>"
add_reaction model=etcher_chf name=chf4 \
    expression="CHF<g> + SiO2_H<s> = SiO2<s>"
add_reaction model=etcher_chf name=chf5 \
    expression="CHF<g> + SiO2_F2<s> = SiF4<v>"
add_reaction model=etcher_chf name=chf6 \
    expression="CHF<g> + SiO2_F2<s> = SiO2<s>"
add_reaction model=etcher_chf name=chf7 \
    expression="CHF<g> + SiO2_F2<s> = SiO2_CF2<s>"
add_reaction model=etcher_chf name=chf8 \
    expression="CHF<g> + SiO2_CF2<s> = SiF4<v>"
add_reaction model=etcher_chf name=chf9 \
    expression="CHF<g> + SiO2_CF2<s> = SiO2<s>"
finalize_model model=etcher_chf

define_model name=etcher_chf2 \
    description="CF4/CHF3/Ar RIE Etch Model with CHF2"
add_source_species model=etcher_chf2 name=CHF2
add_reaction model=etcher_chf2 name=chf21 \
    expression="CHF2<g> + SiO2<s> = SiO2_CF2<s>"
add_reaction model=etcher_chf2 name=chf22 \
    expression="CHF2<g> + SiO2<s> = SiO2_H<s>"
add_reaction model=etcher_chf2 name=chf23 \
    expression="CHF2<g> + SiO2_H<s> = SiF4<v>"
add_reaction model=etcher_chf2 name=chf24 \
    expression="CHF2<g> + SiO2_H<s> = SiO2<s>"
add_reaction model=etcher_chf2 name=chf25 \
    expression="CHF2<g> + SiO2_F2<s> = SiF4<v>"
add_reaction model=etcher_chf2 name=chf26 \
    expression="CHF2<g> + SiO2_F2<s> = SiO2<s>"
add_reaction model=etcher_chf2 name=chf27 \
    expression="CHF2<g> + SiO2_CF2<s> = SiF4<v>"
add_reaction model=etcher_chf2 name=chf28 \
    expression="CHF2<g> + SiO2_CF2<s> = SiO2<s>"
finalize_model model=etcher_chf2

# Define etch machines for each species distribution and reaction properties
# F reactions
define_etch_machine model=etcher_f species_properties=sp_F \
    name=etch_f species_distribution=F_all
define_probability name=pf1 \
    expression="E > 4 ? 0.11 : 0.01"
define_probability name=pf2 \
    expression="E > 4 ? \
                    E > 1764 ? \
                        theta > M_PI / 4 ? \
                            (-4 / M_PI * theta + 2) : \
                        1 : \
                    theta > M_PI / 4 ? \
                        (-4 / M_PI * theta + 2) * \
                        0.025 * (sqrt(E) - 2) : \
                    0.025 * (sqrt(E) - 2) : \
                0"
define_probability name=pf3 \
    expression="E > 4 ? \
                    E > 484 ? \
                        E > 1764 ? \
                            0 : \
                        theta > M_PI / 4 ? \
                            (-4 / M_PI * theta + 2) * \
                            (1 - 0.025 * (sqrt(E) - 2)) : \
                        1 - 0.025 * (sqrt(E) - 2) : \
                    theta > M_PI / 4 ? \
                        (-4 / M_PI * theta + 2) * \
                        0.025 * (sqrt(E) - 2) : \
                    0.025 * (sqrt(E) - 2) : \
                0"
define_probability name=pf4 \
    expression="E > 4 ? \
                    E > 1637.13609467 ? \
                        theta > M_PI / 4 ? \
                            (-4 / M_PI * theta + 2) : \
                        1 : \
                    theta > M_PI / 4 ? \
                        (-4 / M_PI * theta + 2) * \
                        0.026 * (sqrt(E) - 2) : \
                    0.026 * (sqrt(E) - 2) : \
                0"
define_probability name=pf5 \
    expression="E > 4 ? \
                    E > 450.74556213 ? \
                        E > 1637.13609467 ? \
                            0 : \
                        theta > M_PI / 4 ? \
                            (-4 / M_PI * theta + 2) * \
                            (1 - 0.026 * (sqrt(E) - 2)) : \
                        1 - 0.026 * (sqrt(E) - 2) : \
                    theta > M_PI / 4 ? \
                        (-4 / M_PI * theta + 2) * \
                        (0.026 * (sqrt(E) - 2)) : \
                    0.026 * (sqrt(E) - 2) : \
                0"

add_reaction_properties reaction=f1 \
    machine=etch_f probability=pf1
add_reaction_properties reaction=f2 \
    machine=etch_f probability=pf2
add_reaction_properties reaction=f3 \
    machine=etch_f probability=pf3
add_reaction_properties reaction=f4 \
    machine=etch_f probability=pf4
add_reaction_properties reaction=f5 \
    machine=etch_f probability=pf5
add_reaction_properties reaction=f6 \
    machine=etch_f p=0.1

# CF reactions
define_etch_machine model=etcher_cf species_properties=sp_CF \
    name=etch_cf species_distribution=CF_all 
define_probability name=pcf1 \
    expression="E > 4 ? 0.1 : 0"
define_probability name=pcf3 \
    expression="E > 4 ? \
                    E > 32.0190362879 ? \
                        theta > M_PI / 4 ? \
                            max(0, min(0.7, (-4 / M_PI * theta + 2) \
                            * (1 - 0.082 * (sqrt(E) - 2)))) : \
                        E > 201.50148721 ? \
                            0 : \
                        1 - 0.082 * (sqrt(E) - 2) : \
                    0.7 : \
                0.5"
define_probability name=pcf4 \
    expression="E > 4 ? \
                    E > 696.44497323 ? \
                        theta > M_PI / 4 ? \
                            (-4 / M_PI * theta + 2) : \
                        1 : \
                    theta > M_PI / 4 ? \
                        (-4 / M_PI * theta + 2) * \
                        0.041 * (sqrt(E) - 2) : \
                    0.041 * (sqrt(E) - 2) : \
                0"
define_probability name=pcf5 \
    expression="E > 4 ? \
                    E > 201.50148721 ? \
                        E > 696.44497323 ? \
                            0 : \
                        theta > M_PI / 4 ? \
                            (-4 / M_PI * theta + 2) * \
                            (1 - 0.041 * (sqrt(E) - 2)) : \
                        1 - 0.041 * (sqrt(E) - 2) : \
                    theta > M_PI / 4 ? \
                        (-4 / M_PI * theta + 2) * \
                        0.041 * (sqrt(E) - 2) : \
                    0.041 * (sqrt(E) - 2) : \
                0"
define_probability name=pcf6_8chf5 \
    expression="E > 4 ? \
                    E > 666.131519274 ? \
                        theta > M_PI / 4 ? \
                            (-4 / M_PI * theta + 2) : \
                        1 : \
                    theta > M_PI / 4 ? \
                        (-4 / M_PI * theta + 2) * \
                        0.042 * (sqrt(E) - 2) : \
                    0.042 * (sqrt(E) - 2) : \
                0"
define_probability name=pcf7chf6 \
    expression="E > 4 ? \
                    E > 193.342403628 ? \
                        E > 666.131519274 ? \
                            0 : \
                        theta > M_PI / 4 ? \
                            (-4 / M_PI * theta + 2) * \
                            (1 - 0.042 * (sqrt(E) - 2)) : \
                        1 - 0.042 * (sqrt(E) - 2) : \
                    theta > M_PI / 4 ? \
                        (-4 / M_PI * theta + 2) * \
                        0.042 * (sqrt(E) - 2) : \
                    0.042 * (sqrt(E) - 2) : \
                0"
define_probability name=pcf9 \
    expression="E > 4 ? \
                    E > 45.7233560091 ? \
                        theta > M_PI / 4 ? \
                            max(0, min(0.4, 1 - 0.042 * \
                            (sqrt(E) - 2))) : \
                        E > 666.131519274 ? \
                            0 : \
                        1 - 0.042 * (sqrt(E) - 2) : \
                    theta > M_PI / 4 ? \
                        0.04 + (-4 / M_PI * theta + 2) * \
                        0.042 * (sqrt(E) - 2) : \
                    0.4 + 0.042 * (sqrt(E) - 2) : \
                0.4"

add_reaction_properties reaction=cf1 \
    machine=etch_cf probability=pcf1
add_reaction_properties reaction=cf2 \
    machine=etch_cf p=0.5
add_reaction_properties reaction=cf3 \
    machine=etch_cf probability=pcf3
add_reaction_properties reaction=cf4 \
    machine=etch_cf probability=pcf4
add_reaction_properties reaction=cf5 \
    machine=etch_cf probability=pcf5
add_reaction_properties reaction=cf6 \
    machine=etch_cf probability=pcf6_8chf5
add_reaction_properties reaction=cf7 \
    machine=etch_cf probability=pcf7chf6
add_reaction_properties reaction=cf8 \
    machine=etch_cf probability=pcf6_8chf5
add_reaction_properties reaction=cf9 \
    machine=etch_cf probability=pcf9

# CF2 reactions
define_etch_machine model=etcher_cf2 species_properties=sp_CF2 \
    name=etch_cf2 species_distribution=CF2_all
define_probability name=pcf21 \
    expression="E > 4 ? 0.86 : 0.66"
define_probability name=pcf22 \
    expression="E > 4 ? \
                    E > 294.174471993 ? \
                        theta > M_PI / 4 ? \
                            (-4 / M_PI * theta + 2) : \
                        1 : \
                    theta > M_PI / 4 ? \
                        (-4 / M_PI * theta + 2) * \
                        0.066 * (sqrt(E) - 2) : \
                    0.066 * (sqrt(E) - 2) : \
                0"
define_probability name=pcf23 \
    expression="E > 4 ? \
                    E > 91.6951331497 ? \
                        E > 294.174471993 ? \
                            0 : \
                        theta > M_PI / 4 ? \
                            (-4 / M_PI * theta + 2) * \
                            (1 - 0.066 * (sqrt(E) - 2)) : \
                        1 - 0.066 * (sqrt(E) - 2) : \
                    theta > M_PI / 4 ? \
                        (-4 / M_PI * theta + 2) * \
                        0.066 * (sqrt(E) - 2) : \
                    0.066 * (sqrt(E) - 2) : \
                0"
define_probability name=pcf24_6 \
    expression="E > 4 ? \
                    E > 286.468255736 ? \
                        theta > M_PI / 4 ? \
                            (-4 / M_PI * theta + 2) : \
                        1 : \
                    theta > M_PI / 4 ? \
                        (-4 / M_PI * theta + 2) * \
                        0.067* (sqrt(E) - 2) : \
                    0.067 * (sqrt(E) - 2) : \
                0"
define_probability name=pcf25_7 \
    expression="E > 4 ? \
                    E > 89.5424370684 ? \
                        E > 286.468255736 ? \
                            0 : \
                        theta > M_PI / 4 ? \
                            (-4 / M_PI * theta + 2) * \
                            (1 - 0.067 * (sqrt(E) - 2)) : \
                        1 - 0.067 * (sqrt(E) - 2) : \
                    theta > M_PI / 4 ? \
                        (-4 / M_PI * theta + 2) * \
                        0.067 * (sqrt(E) - 2) : \
                    0.067 * (sqrt(E) - 2) : \
                0"

add_reaction_properties reaction=cf21 \
    machine=etch_cf2 probability=pcf21
add_reaction_properties reaction=cf22 \
    machine=etch_cf2 probability=pcf22
add_reaction_properties reaction=cf23 \
    machine=etch_cf2 probability=pcf23
add_reaction_properties reaction=cf24 \
    machine=etch_cf2 probability=pcf24_6
add_reaction_properties reaction=cf25 \
    machine=etch_cf2 probability=pcf25_7
add_reaction_properties reaction=cf26 \
    machine=etch_cf2 probability=pcf24_6
add_reaction_properties reaction=cf27 \
    machine=etch_cf2 probability=pcf25_7

# CF3 reactions
define_etch_machine model=etcher_cf3 species_properties=sp_CF3 \
    name=etch_cf3 species_distribution=CF3_all
define_probability name=pcf31 \
    expression="E > 4 ? 0.2 : 0.1"
define_probability name=pcf32 \
    expression="E > 4 ? 0.4 : 0.2"
define_probability name=pcf33 \
    expression="E > 4 ? \
                    E > 165.625708885 ? \
                        theta > M_PI / 4 ? \
                            (-4 / M_PI * theta + 2) : \
                        1 : \
                    theta > M_PI / 4 ? \
                        (-4 / M_PI * theta + 2) * \
                        0.092 * (sqrt(E) - 2) : \
                    0.092 * (sqrt(E) - 2) : \
                0"
define_probability name=pcf34 \
    expression="E > 4 ? \
                    E > 55.2759924386 ? \
                        E > 165.625708885 ? \
                            0 : \
                        theta > M_PI / 4 ? \
                            (-4 / M_PI * theta + 2) * \
                            (1 - 0.092 * (sqrt(E) - 2)) : \
                        1 - 0.092 * (sqrt(E) - 2) : \
                    theta > M_PI / 4 ? \
                        (-4 / M_PI * theta + 2) * \
                        0.092 * (sqrt(E) - 2) : \
                    0.092 * (sqrt(E) - 2) : \
                0"
define_probability name=pcf35_7 \
    expression="E > 4 ? \
                    E > 162.631055613 ? \
                        theta > M_PI / 4 ? \
                            (-4 / M_PI * theta + 2) : \
                        1 : \
                    theta > M_PI / 4 ? \
                        (-4 / M_PI * theta + 2) * \
                        0.093 * (sqrt(E) - 2) : \
                    0.093 * (sqrt(E) - 2) : \
                0"
define_probability name=pcf36_8 \
    expression="E > 4 ? \
                    E > 54.4104520754 ? \
                        E > 162.631055613 ? \
                            0 : \
                        theta > M_PI / 4 ? \
                            (-4 / M_PI * theta + 2) * \
                            (1 - 0.093 * (sqrt(E) - 2)) : \
                        1 - 0.093 * (sqrt(E) - 2) : \
                    theta > M_PI / 4 ? \
                        (-4 / M_PI * theta + 2) * \
                        0.093 * (sqrt(E) - 2) : \
                    0.093 * (sqrt(E) - 2) : \
                0"

add_reaction_properties reaction=cf31 \
    machine=etch_cf3 probability=pcf31
add_reaction_properties reaction=cf32 \
    machine=etch_cf3 probability=pcf32
add_reaction_properties reaction=cf33 \
    machine=etch_cf3 probability=pcf33
add_reaction_properties reaction=cf34 \
    machine=etch_cf3 probability=pcf34
add_reaction_properties reaction=cf35 \
    machine=etch_cf3 probability=pcf35_7
add_reaction_properties reaction=cf36 \
    machine=etch_cf3 probability=pcf36_8
add_reaction_properties reaction=cf37 \
    machine=etch_cf3 probability=pcf35_7
add_reaction_properties reaction=cf38 \
    machine=etch_cf3 probability=pcf36_8

# Ar reflections and sputtering
define_etch_machine model=etcher_ar species_properties=sp_Ar \
    name=etch_ar species_distribution=Ar_all
define_probability name=p_reflection \
    expression="(theta > M_PI / 3.) ? \
                    (6 / M_PI * theta) - 2 : \
                0"
define_probability name=p_sputter \
    expression="E > 50 ? \
                    (theta > M_PI / 3 ? \
                        max(1, (0.00754 * sqrt(E) - 0.05332) * \
                        pow(cos(theta), -2.08) * \
                        exp(0.37 - (0.37 / cos(theta)))) : \
                    max((6 / M_PI * theta) - 2, \
                    (0.0003667 * E - 0.0183333) * \
                    pow(cos(theta), -2.08) * \
                    exp(0.37 - (0.37 / cos(theta))))) : \
                0"
define_probability name=p_sputter_polymer \
    expression="E > 65 ? \
                    (theta > M_PI / 3 ? \
                        max(1, (0.00754 * sqrt(E) - 0.06079) * \
                        pow(cos(theta), -2.08) * \
                        exp(0.37 - (0.37 / cos(theta)))) : \
                    max((6 / M_PI * theta) - 2, \
                    (0.0003667 * E - 0.0183333) * \
                    pow(cos(theta), -2.08) * \
                    exp(0.37 - (0.37 / cos(theta))))) : \
                0"

add_reaction_properties machine=etch_ar \
    reaction=Ar_SiO2_reflection probability=p_reflection
add_reaction_properties machine=etch_ar \
    reaction=Ar_SiO2_F2_reflection probability=p_reflection
add_reaction_properties machine=etch_ar \
    reaction=Ar_SiO2_CF2_reflection probability=p_reflection
add_reaction_properties machine=etch_ar \
    reaction=Ar_SiO2_H_reflection probability=p_reflection
add_reaction_properties machine=etch_ar \
    probability=p_sputter reaction=sputter_SiO2
add_reaction_properties machine=etch_ar \
    probability=p_sputter_polymer reaction=sputter_SiO2_F2 
add_reaction_properties machine=etch_ar \
    probability=p_sputter_polymer reaction=sputter_SiO2_CF2
add_reaction_properties machine=etch_ar \
    probability=p_sputter_polymer reaction=sputter_SiO2_H

# H reactions
define_etch_machine model=etcher_h species_properties=sp_H \
    name=etch_h species_distribution=H_all
define_probability name=ph2_4_5_6_7 \
    expression="E > 4 ? \
                    E > 63504 ? \
                        0 : \
                    theta > M_PI / 4 ? \
                        (-4 / M_PI * theta + 2) \
                        * 0.001 * (sqrt(E) - 2) : \
                    0.001 * (sqrt(E) - 2) : \
                0"
define_probability name=ph3 \
    expression="E > 4 ? \
                    E > 63504 ? \
                        0 : \
                    theta > M_PI / 4 ? \
                        0.5 + (-4 / M_PI * theta + 2) \
                        * 0.001 * (sqrt(E) - 2) : \
                    0.5 + 0.001 * (sqrt(E) - 2) : \
                0.5"

add_reaction_properties reaction=h1 \
    machine=etch_h p=1
add_reaction_properties reaction=h2 \
    machine=etch_h probability=ph2_4_5_6_7
add_reaction_properties reaction=h3 \
    machine=etch_h probability=ph3
add_reaction_properties reaction=h4 \
    machine=etch_h probability=ph2_4_5_6_7
add_reaction_properties reaction=h5 \
    machine=etch_h probability=ph2_4_5_6_7
add_reaction_properties reaction=h6 \
    machine=etch_h probability=ph2_4_5_6_7
add_reaction_properties reaction=h7 \
    machine=etch_h probability=ph2_4_5_6_7

# H2 reactions
define_etch_machine model=etcher_h2 species_properties=sp_H2 \
    name=etch_h2 species_distribution=H2_all
define_probability name=ph2_all \
    expression="E > 4 ? \
                    E > 7281.77777778 ? \
                        0.5 : \
                    theta > M_PI / 4 ? \
                        (-4 / M_PI * theta + 2) * \
                        0.003 * (sqrt(E) - 2) : \
                    0.003 * (sqrt(E) - 2) : \
                0"

add_reaction_properties reaction=h21 \
    machine=etch_h2 probability=ph2_all
add_reaction_properties reaction=h22 \
    machine=etch_h2 probability=ph2_all
add_reaction_properties reaction=h23 \
    machine=etch_h2 probability=ph2_all
add_reaction_properties reaction=h24 \
    machine=etch_h2 probability=ph2_all
add_reaction_properties reaction=h25 \
    machine=etch_h2 probability=ph2_all
add_reaction_properties reaction=h26 \
    machine=etch_h2 probability=ph2_all

# CHF reactions
define_etch_machine model=etcher_chf species_properties=sp_CHF \
    name=etch_chf species_distribution=CHF_all
define_probability name=pchf1 \
    expression="E > 4 ? 0.6 : 0.5"
define_probability name=pchf2 \
    expression="E > 4 ? 0.2 : 0"
define_probability name=pchf3_8 \
    expression="E > 4 ? \
                    E > 637.856138453 ? \
                        theta > M_PI / 4 ? \
                            (-4 / M_PI * theta + 2) : \
                        1 : \
                    theta > M_PI / 4 ? \
                        (-4 / M_PI * theta + 2) \
                        * 0.043 * (sqrt(E) - 2) : \
                    0.043 * (sqrt(E) - 2) : \
                0"
define_probability name=pchf4_9 \
    expression="E > 4 ? \
                    E > 185.719848567 ? \
                        E > 637.856138453 ? \
                            0 : \
                        theta > M_PI / 4 ? \
                            (-4 / M_PI * theta + 2) \
                            * (1 - 0.043 * (sqrt(E) - 2)) : \
                        1 - 0.043 * (sqrt(E) - 2) : \
                    theta > M_PI / 4 ? \
                        (-4 / M_PI * theta + 2) \
                        * 0.043 * (sqrt(E) - 2) : \
                    0.043 * (sqrt(E) - 2) : \
                0"
define_probability name=pchf7 \
    expression="E > 4 ? \
                    theta > M_PI / 4 ? \
                        max(0, (-4 / M_PI * theta + 2) \
                        * (1 - 0.084 * (sqrt(E) - 2))) : \
                    E > 193.342403628 ? \
                        0 : \
                    1 - 0.084 * (sqrt(E) - 2) : \
                1"

add_reaction_properties reaction=chf1 \
    machine=etch_chf probability=pchf1
add_reaction_properties reaction=chf2 \
    machine=etch_chf probability=pchf2
add_reaction_properties reaction=chf3 \
    machine=etch_chf probability=pchf3_8
add_reaction_properties reaction=chf4 \
    machine=etch_chf probability=pchf4_9
add_reaction_properties reaction=chf5 \
    machine=etch_chf probability=pcf6_8chf5
add_reaction_properties reaction=chf6 \
    machine=etch_chf probability=pcf7chf6
add_reaction_properties reaction=chf7 \
    machine=etch_chf probability=pchf7
add_reaction_properties reaction=chf8 \
    machine=etch_chf probability=pchf3_8
add_reaction_properties reaction=chf9 \
    machine=etch_chf probability=pchf4_9

# CHF2 reactions
define_etch_machine model=etcher_chf2 species_properties=sp_CHF2 \
    name=etch_chf2 species_distribution=CHF2_all
define_probability name=pchf21 \
    expression="E > 4 ? 0.8 : 1"
define_probability name=pchf22 \
    expression="E > 4 ? 0.2 : 0"
define_probability name=pchf23_7 \
    expression="E > 4 ? \
                    E > 272.010922075 ? \
                        theta > M_PI / 4 ? \
                            (-4 / M_PI * theta + 2) : \
                        1 : \
                    theta > M_PI / 4 ? \
                        (-4 / M_PI * theta + 2) * \
                        0.069 * (sqrt(E) - 2) : \
                    0.069 * (sqrt(E) - 2) : \
                0"
define_probability name=pchf24_8 \
    expression="E > 4 ? \
                    E > 85.495484142 ? \
                        E > 272.010922075 ? \
                            0 : \
                        theta > M_PI / 4 ? \
                            (-4 / M_PI * theta + 2) * \
                            (1 - 0.069 * (sqrt(E) - 2)) : \
                        1 - 0.069 * (sqrt(E) - 2) : \
                    theta > M_PI / 4 ? \
                        (-4 / M_PI * theta + 2) * \
                        0.069 * (sqrt(E) - 2) : \
                    0.069 * (sqrt(E) - 2) : \
                0"
define_probability name=pchf25 \
    expression="E > 4 ? \
                    E > 279.08650519 ? \
                        theta > M_PI / 4 ? \
                            (-4 / M_PI * theta + 2) : \
                        1 : \
                    theta > M_PI / 4 ? \
                        (-4 / M_PI * theta + 2) * \
                        0.068 * (sqrt(E) - 2) : \
                    0.068 * (sqrt(E) - 2) : \
                0"
define_probability name=pchf26 \
    expression="E > 4 ? \
                    E > 87.4775086505 ? \
                        E > 279.08650519 ? \
                            0 : \
                        theta > M_PI / 4 ? \
                            (-4 / M_PI * theta + 2) * \
                            (1 - 0.068 * (sqrt(E) - 2)) : \
                        1 - 0.068 * (sqrt(E) - 2) : \
                    theta > M_PI / 4 ? \
                        (-4 / M_PI * theta + 2) * \
                        0.068 * (sqrt(E) - 2) : \
                    0.068 * (sqrt(E) - 2) : \
                0"

add_reaction_properties reaction=chf21 \
    machine=etch_chf2 probability=pchf21
add_reaction_properties reaction=chf22 \
    machine=etch_chf2 probability=pchf22
add_reaction_properties reaction=chf23 \
    machine=etch_chf2 probability=pchf23_7
add_reaction_properties reaction=chf24 \
    machine=etch_chf2 probability=pchf24_8
add_reaction_properties reaction=chf25 \
    machine=etch_chf2 probability=pchf25
add_reaction_properties reaction=chf26 \
    machine=etch_chf2 probability=pchf26
add_reaction_properties reaction=chf27 \
    machine=etch_chf2 probability=pchf23_7
add_reaction_properties reaction=chf28 \
    machine=etch_chf2 probability=pchf24_8

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
    etch machine=etch_chf method=pmc time=$ETCH_INTERVAL_MIN \
        spacing= [list "$GRID_SIZE_UM" "$GRID_SIZE_UM" "$GRID_SIZE_UM"] 
    etch machine=etch_chf2 method=pmc time=$ETCH_INTERVAL_MIN \
        spacing= [list "$GRID_SIZE_UM" "$GRID_SIZE_UM" "$GRID_SIZE_UM"] 
    etch machine=etch_h method=pmc time=$ETCH_INTERVAL_MIN \
        spacing= [list "$GRID_SIZE_UM" "$GRID_SIZE_UM" "$GRID_SIZE_UM"] 
    etch machine=etch_h2 method=pmc time=$ETCH_INTERVAL_MIN \
        spacing= [list "$GRID_SIZE_UM" "$GRID_SIZE_UM" "$GRID_SIZE_UM"] 
    save
}
