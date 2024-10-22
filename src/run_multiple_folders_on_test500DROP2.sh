#!/bin/bash

folders=('arch2_PARISfinetuned_PARIStest0080' 'arch2_PARISfinetuned_PARIStest0097' 'arch2_PARISfinetuned_PARIStest0092' 'arch2_PARISfinetuned_PARIStest0089' 'arch2_PARISfinetuned_PARIStest0023_PARISfinetunedFPweight_PARIStest0056' 'arch2_PARISfinetuned_PARIStest0023_PARISfinetunedFPweight_PARIStest0063' 'arch2_PARISfinetuned_PARIStest0023_PARISfinetunedFPweight_PARIStest0025' 'arch2_PARISfinetuned_PARIStest0023_PARISfinetunedFPweight_PARIStest0030' 'arch2_PARISfinetuned_PARIStest0023_PARISfinetunedFPweight_PARIStest0035' 'arch2_PARISfinetuned_PARIStest0023_PARISfinetunedFPweight_PARIStest0038' 'arch2_PARISfinetuned_PARIStest0023_PARISfinetunedFPweight_PARIStest0043' 'arch2_PARISfinetuned_PARIStest0023_PARISfinetunedFPweight_PARIStest0046' 'arch2_PARISfinetuned_PARIStest0023_PARISfinetunedFPweight_PARIStest0050' 'arch2_PARISfinetuned_PARIStest0023_PARISfinetunedFPweight_PARIStest0052' 'arch2_PARISfinetuned_PARIStest0023_PARISfinetunedFPweight_PARIStest0055' 'arch2_PARISfinetuned_PARIStest0023_PARISfinetunedFPweight_PARIStest0062' 'arch2_PARISfinetuned_PARIStest0023_PARISfinetunedFPweight_PARIStest0066' 'arch2_PARISfinetuned_PARIStest0023_PARISfinetunedFPweight_PARIStest0067' 'arch2_PARISfinetuned_PARIStest0023_PARISfinetunedFPweight_PARIStest0068' 'arch2_PARISfinetuned_PARIStest0023_PARISfinetunedFPweight_PARIStest0069' 'arch2_PARISfinetuned_PARIStest0023_PARISfinetunedFPweight_PARIStest0072' 'arch2_PARISfinetuned_PARIStest0023_PARISfinetunedFPweight_PARIStest0074' 'arch2_PARISfinetuned_PARIStest0023_PARISfinetunedFPweight_PARIStest0079' 'arch2_PARISfinetuned_PARIStest0023_PARISfinetunedFPweight_PARIStest0080' 'arch2_PARISfinetuned_PARIStest0023_PARISfinetunedFPweight_PARIStest0081' 'arch2_PARISfinetuned_PARIStest0023_PARISfinetunedFPweight_PARIStest0082' 'arch2_PARISfinetuned_PARIStest0023_PARISfinetunedFPweight_PARIStest0086' 'arch2_PARISfinetuned_PARIStest0023_PARISfinetunedFPweight_PARIStest0087' 'arch2_PARISfinetuned_PARIStest0023_PARISfinetunedFPweight_PARIStest0089' 'arch2_PARISfinetuned_PARIStest0023_PARISfinetunedFPweight_PARIStest0092' 'arch2_PARISfinetuned_PARIStest0023_PARISfinetunedFPweight_PARIStest0098' 'arch2_PARISfinetuned_PARIStest0023_PARISfinetunedFPweight_PARIStest0104' 'arch2_PARISfinetuned_PARIStest0023_PARISfinetunedFPweight_PARIStest0105' 'arch2_PARISfinetuned_PARIStest0023_PARISfinetunedSPLASH_PARIStest0030' 'arch2_PARISfinetuned_PARIStest0023_PARISfinetunedSPLASH_PARIStest0036' 'arch2_PARISfinetuned_PARIStest0023_PARISfinetunedSPLASH_PARIStest0037' 'arch2_PARISfinetuned_PARIStest0023_PARISfinetunedSPLASH_PARIStest0038' 'arch2_PARISfinetuned_PARIStest0023_PARISfinetunedSPLASH_PARIStest0041' 'arch2_PARISfinetuned_PARIStest0023_PARISfinetunedSPLASH_PARIStest0042')

for folder in "${folders[@]}"; do

    nohup python run_binary_cl_on_test_500.py --folder="$folder" --how=train_val_fine_tuning &> run_binary_cl_on_test_500train_val_fine_tuning.out &
    pid1=$!

    nohup python run_binary_cl_on_test_500.py --folder="$folder" --how=val &> run_binary_cl_on_test_val.out &
    pid2=$!

    wait "$pid1"
    wait "$pid2"
done

# nohup ./run_multiple_folders_on_test500DROP.sh &> run_multiple_folders_on_test500DROP.out &



#  # Wait for each command within the folder iteration to complete
# wait "$pid1"
