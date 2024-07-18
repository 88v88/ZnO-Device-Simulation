# Simulate plasma etching of 50nm holes into SiO2 layer on Pt
# ================================================== #

# Platinum base
define_structure material=Pt point_min={0 0 0} \
    point_max={0.5 0.5 0.5}

# Deposit oxide
define_deposit_machine anisotropy=0.8 curvature=0 \
    material=SiO2 model=simple rate=1
deposit spacing=0.1 time=0.1

# Resist mask
define_layout name=maskholelayout cell=TOP \
    layout_file=maskhole2.gds scale=1 \
    domain_min= {0 0} domain_max= {0.5 0.5} \
    layer_names= {maskhole} layer_numbers= {1:0}
define_mask name=mask1 layout=maskholelayout \
    domain=SIM3D layer=maskhole
pattern mask=mask1 material=Resist accuracy=0.01 \
    thickness=0.1 type=dark_positive
save

# Etch holes TODO: replace with plasma model
define_etch_machine model=rie2 exponent=100
add_material material=Resist rate=0.01 anisotropy=0.8 sticking=1.0 reflection=0.3
add_material material=SiO2 rate=0.1 anisotropy=0.8 sticking=0.5 reflection=0.3
add_material material=Pt rate=0.01 anisotropy=0.8 sticking=0.5 reflection=0.3
etch method=pmc spacing= {0.001 0.001 0.001} time=1.5
save
