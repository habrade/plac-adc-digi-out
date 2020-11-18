add wave -divider DUT -position insertpoint sim:/tb_test/DUT/*
add wave -position insertpoint  \
sim:/tb_test/DUT/t1_v
add wave -position insertpoint  \
sim:/tb_test/DUT/t2_v
add wave -position insertpoint  \
sim:/tb_test/DUT/t3_v
add wave -position insertpoint  \
sim:/tb_test/DUT/t4_v
add wave -position insertpoint  \
sim:/tb_test/DUT/t5_v
add wave -divider t1_comp -position insertpoint sim:/tb_test/DUT/gen_t1_in/*
add wave -divider t2_comp -position insertpoint sim:/tb_test/DUT/gen_t2_in/*
add wave -divider t3_comp -position insertpoint sim:/tb_test/DUT/gen_t3_in/*
add wave -divider t4_comp -position insertpoint sim:/tb_test/DUT/gen_t4_in/*
add wave -divider t5_comp -position insertpoint sim:/tb_test/DUT/gen_t5_in/*

run -all
