mod input_0;
mod input_1;
mod output_0;


use orion::operators::tensor::{TensorTrait, Tensor};
use core::array::{ArrayTrait, SpanTrait};
use orion::operators::tensor::U32TensorPartialEq;
use orion::utils::{assert_eq, assert_seq_eq};
use orion::operators::tensor::U32Tensor;

#[test]
#[available_gas(2000000000)]
fn test_compress_u32_3d_axis3() {
    let input_0 = input_0::input_0();
    let input_1 = input_1::input_1();
    let z_0 = output_0::output_0();

    let y_0 = input_0.compress(condition: input_1, axis: Option::Some(3));

    assert_eq(y_0, z_0);
}
