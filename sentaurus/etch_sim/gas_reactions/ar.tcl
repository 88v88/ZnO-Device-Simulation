# Argon Ionization - Source: Sentaurus Topography 3D Manual
add_bulk_reaction plasma_model=plasma name=ar_ion \
    expression="Ar + e- = Ar+ + 2e-" \
    rate_coefficient_type=arrhenius \
    a=2.3e-14 b=0.6329 c=16.0627 energy_transfer=15.76<eV>