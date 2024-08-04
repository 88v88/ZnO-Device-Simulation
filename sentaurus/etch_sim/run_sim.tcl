# Simulate etching SiO2 under hard mask by CF4/CHF3/Ar
# in Sentaurus Topography 3D

# Plasma Settings
set RF_POWER_W 300
set PRESSURE_MTORR 10
set CF4_SCCM 10
set CHF3_SCCM 0
set AR_SCCM 5

# Layout Settings
set SIO2_UM 0.1
set MASK_HOLE_PATH layout.gds
set MASK_XSIZE_UM 0.1
set MASK_YSIZE_UM 0.1
set MASK_THICKNESS 0.1

# Etch Settings
set GRID_SIZE_UM 0.002
set ETCH_INTERVAL_MIN 0.1
set N_ETCH_INTERVALS 5

# File settings
set OUTPUT_PATH output_files/output.tdr
set SAVE_DISTRIBUTIONS false
set DISTRIBUTIONS_FROM_FILE false
set SAVE_INTERMEDIATE false
set IMPORT_STRUCTURE false
set STRUCTURE_PATH output_files/output.tdr
set STRUCTURE_GEOMETRY output_geometry_35

# Miscellaneous etcher settings
set CHAMBER_RADIUS_CM 12
set CHAMBER_HEIGHT_CM 10
set GAS_TEMP_K 300
set PLASMA_TOLERANCE 1e-3
set PLASMA_STEP_SIZE 1e-4
set MAX_SOLVER_SEC 180

# Run plasma simulation
source sims/plasma_sim.tcl 

# Run etch simulation
source sims/etch_sim.tcl

