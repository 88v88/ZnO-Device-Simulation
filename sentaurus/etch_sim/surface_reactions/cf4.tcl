# Surface reaction set describing reaction of CF4-derived
# species (F, CF, CF2, CF3) with SiO2 and adsorbates

# Reaction model for F+ ions and F radicals
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

# Discard remaining F instead of isotropic reemission
define_species_properties name=sp_F species=F default_event=discard
define_etch_machine model=etcher_f species_properties=sp_F \
    name=etch_f species_distribution=F_all

# Probabilities for reactions involving F
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

# Associate probabilities with corresponding F reactions
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

# Reaction model for CF+ ions and CF radicals
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

# Discard non-reacting CF species instead of isotropic reemission
define_species_properties name=sp_CF species=CF default_event=discard
define_etch_machine model=etcher_cf species_properties=sp_CF \
    name=etch_cf species_distribution=CF_all 

# Probabilities for reactions involving CF
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

# Associate probabilities with corresponding CF reactions
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

# Reaction model for CF2+ ions and CF2 radicals
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

# Discard remaining CF2 instead of isotropic reemission
define_species_properties name=sp_CF2 species=CF2 default_event=discard
define_etch_machine model=etcher_cf2 species_properties=sp_CF2 \
    name=etch_cf2 species_distribution=CF2_all

# Probabilities for reactions involving CF2
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

# Associate probabilities with corresponding CF2 reactions
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

# Reaction model for CF3+ ions and CF3 radicals
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

# Discard remaining CF3 instead of isotropic reemission
define_species_properties name=sp_CF3 species=CF3 default_event=discard
define_etch_machine model=etcher_cf3 species_properties=sp_CF3 \
    name=etch_cf3 species_distribution=CF3_all

# Probabilities for reactions involving CF3
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

# Associate probabilities with corresponding CF3 reactions
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