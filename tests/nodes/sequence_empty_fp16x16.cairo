mod output_0;


use orion::operators::sequence::FP16x16Sequence;
use core::array::{ArrayTrait, SpanTrait};
use orion::operators::tensor::FP16x16TensorPartialEq;
use orion::operators::sequence::SequenceTrait;
use orion::utils::{assert_eq, assert_seq_eq};

#[test]
#[available_gas(2000000000)]
fn test_sequence_empty_fp16x16() {
    let z = output_0::output_0();

    let y = SequenceTrait::sequence_empty();

    assert_seq_eq(y, z);
}
