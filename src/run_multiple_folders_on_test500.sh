#!/bin/bash

folders=('all_modelarch2_easypretrain3_paristfinetuning14_splash0062_trainallNOricseq0096' 'all_modelarch2_easypretrain3_paristfinetuning14_splash0062_trainallNOricseq0097' 'all_modelarch2_easypretrain3_paristfinetuning14_splash0062_trainallNOricseq0114' 'all_modelarch2_easypretrain3_paristfinetuning14_splash0062_trainallNOricseq0141' 'all_modelarch2_easypretrain3_paristfinetuning14_splash0062_trainallNOricseq0142' 'all_modelarch2_easypretrain3_paristfinetuning14_splash0062_trainallNOricseq0146' 'all_modelarch2_easypretrain3_paristfinetuning14_splash0062_trainallNOricseq0168' 'all_modelarch2_easypretrain3_paristfinetuning14_splash0076_trainallNOricseq0110' 'all_modelarch2_easypretrain3_paristfinetuning14_splash0076_trainallNOricseq0117' 'all_modelarch2_easypretrain3_paristfinetuning14_splash0076_trainallNOricseq0118' 'all_modelarch2_easypretrain3_paristfinetuning14_splash0076_trainallNOricseq0122' 'all_modelarch2_easypretrain3_paristfinetuning14_splash0076_trainallNOricseq0130' 'all_modelarch2_easypretrain3_paristfinetuning14_splash0076_trainallNOricseq0135' 'all_modelarch2_easypretrain3_paristfinetuning14_splash0076_trainallNOricseq0182' 'all_modelarch2_easypretrain3_paristfinetuning14_splash0076_trainallNOricseq0183')

for folder in "${folders[@]}"; do
    nohup python run_binary_cl_on_test_500.py --folder="$folder" &> run_binary_cl_on_test_500.out &
    pid1=$!

    nohup python run_binary_cl_on_test_500.py --folder="$folder" --dataset=mario &> run_binary_cl_on_test_mario500.out &
    pid2=$!

    nohup python run_binary_cl_on_test_500.py --folder="$folder" --dataset=ricseq &> run_binary_cl_on_test_ricseq500.out &
    pid3=$!

    nohup python run_binary_cl_on_test_500.py --folder="$folder" --dataset=splash &> run_binary_cl_on_test_splash500.out &
    pid4=$!

    # Wait for each command within the folder iteration to complete
    wait "$pid1"
    wait "$pid2"
    wait "$pid3"
    wait "$pid4"
done

# nohup ./run_multiple_folders_on_test500.sh &> run_multiple_folders_on_test500.out &
