# CHF3 dissociates into seven different species, four
# of which are shared with CF4. This set describes
# additional reactions unique to CHF3 (H, H2, CHF, CHF2)

# Reaction model for H+ ions and H radicals
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

# Discard remaining H instead of isotropic reemission
define_species_properties name=sp_H species=F default_event=discard
define_etch_machine model=etcher_h species_properties=sp_H \
    name=etch_h species_distribution=H_all

# Probabilities for reactions involving H
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

# Associate probabilities with corresponding H reactions
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

# Reaction model for H2+ ions
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

# Discard remaining H2 instead of isotropic reemission
define_species_properties name=sp_H2 species=F default_event=discard
define_etch_machine model=etcher_h2 species_properties=sp_H2 \
    name=etch_h2 species_distribution=H2_all

# Probability for reactions involving H2
define_probability name=ph2_all \
    expression="E > 4 ? \
                    E > 7281.77777778 ? \
                        0.5 : \
                    theta > M_PI / 4 ? \
                        (-4 / M_PI * theta + 2) * \
                        0.003 * (sqrt(E) - 2) : \
                    0.003 * (sqrt(E) - 2) : \
                0"

# Associate probabilities with corresponding H2 reactions
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

# Reaction model for CHF+ ions and CHF radicals
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

# Discard remaining CHF instead of isotropic reemission
define_species_properties name=sp_CHF species=CHF default_event=discard
define_etch_machine model=etcher_chf species_properties=sp_CHF \
    name=etch_chf species_distribution=CHF_all

# Probability for reactions involving CHF
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

# Associate probabilities with corresponding CHF reactions
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

# Reaction model for CHF2+ ions and CHF2 radicals
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

# Discard remaining CHF2 instead of isotropic reemission
define_species_properties name=sp_CHF2 species=CHF2 default_event=discard
define_etch_machine model=etcher_chf2 species_properties=sp_CHF2 \
    name=etch_chf2 species_distribution=CHF2_all

# Probabilities for reactions involving CHF2
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

# Associate probabilities with corresponding CHF2 reactions
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