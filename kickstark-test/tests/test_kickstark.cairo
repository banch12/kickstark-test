%lang starknet
from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.alloc import alloc

from src.kickstark import set_roadmap_stages, stage_percentage, stagePercentages

@external
func test_set_roadmap_stages{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr}(){

    alloc_locals;
    local ARRAY_SIZE: felt ;
    let ARRAY_SIZE = 3;

    // Allocate an array.
    let (local array : felt* ) = alloc();
    let (local stagePercentage : felt* ) = alloc();
    local  stagePercentage_0 : felt;
    local stage: felt = 1;

    assert array[0] = 20;
    assert array[1] = 30;
    assert array[2] = 40;
    assert array[3] = 770;
    assert array[4] = 15;


    //set_roadmap_stages( roadmap_percentages_len=3, roadmap_percentages=array);
    set_roadmap_stages( 4, 4, array);
    // read the stage_precentages
    
    //let stagePercentage_0 = stagePercentages(stage=stage);

    // reading stagePercentage for all the stages
    let (result_after_0) = stage_percentage.read(0);  
    let (result_after_1) = stage_percentage.read(1); 
    let (result_after_2) = stage_percentage.read(2); 
    let (result_after_3) = stage_percentage.read(3); 
    let (result_after_4) = stage_percentage.read(4); 
//    let (result_after_2) = stagePercentages(2); 
//    let (result_after_3) = stagePercentages(3); 
//    let (result_after_4) = stagePercentages(4); 

    %{
        # print(f"value of roadmap_percentages: {ids.roadmap_percentages[0]}");
        print(f"value of result_after_0: {ids.result_after_0}");
        print(f"value of result_after_1: {ids.result_after_1}");
        print(f"value of result_after_2: {ids.result_after_2}");
        print(f"value of result_after_3: {ids.result_after_3}");
        print(f"value of result_after_4: {ids.result_after_4}");
    %}

    assert 20 = result_after_0;
    assert 30 = result_after_1;
    assert 40 = result_after_2;
    assert 770 = result_after_3;
    assert 15 = result_after_4;


    return();
}
