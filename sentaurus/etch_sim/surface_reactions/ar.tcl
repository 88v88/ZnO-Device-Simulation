# Surface reaction set describing reflection and sputtering
# of Ar on SiO2 and adsorbates

# Reaction model for Ar+ ions
define_model name=etcher_ar \
    description="CF4/CHF3/Ar RIE Etch with Ar"
add_source_species model=etcher_ar name=Ar
add_reaction model=etcher_ar name=Ar_SiO2_reflection \
    expression="Ar<g>       + SiO2<s>     = Ar<r> + SiO2<s>"
add_reaction model=etcher_ar name=Ar_SiO2_F2_reflection \
    expression="Ar<g>       + SiO2_F2<s>  = Ar<r> + SiO2_F2<s>"
add_reaction model=etcher_ar name=Ar_SiO2_CF2_reflection \
    expression="Ar<g>       + SiO2_CF2<s> = Ar<r> + SiO2_CF2<s>"
add_reaction model=etcher_ar name=Ar_SiO2_H_reflection \
    expression="Ar<g>       + SiO2_H<s>   = Ar<r> + SiO2_H<s>"
add_reaction model=etcher_ar name=sputter_SiO2 \
    expression="SiO2<s>     + Ar<g>       = SiO2<v>"
add_reaction model=etcher_ar name=sputter_SiO2_F2 \
    expression="SiO2_F2<s>  + Ar<g>       = SiO2_F2<v>"
add_reaction model=etcher_ar name=sputter_SiO2_CF2 \
    expression="SiO2_CF2<s> + Ar<g>       = SiO2_CF2<v>"
add_reaction model=etcher_ar name=sputter_SiO2_H \
    expression="SiO2_H<s>   + Ar<g>       = SiO2_H<v>"
finalize_model model=etcher_ar

# Discard remaining Ar instead of isotropic reemission
define_species_properties name=sp_Ar species=Ar default_event=discard
define_etch_machine model=etcher_ar species_properties=sp_Ar \
    name=etch_ar species_distribution=Ar_all

# Probabilities for sputtering and reflection of Ar
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

# Associate probabilities with corresponding Ar reactions
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