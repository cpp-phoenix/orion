mod input_0;
mod input_1;
mod output_0;


use orion::operators::tensor::U32TensorPartialEq;
use orion::operators::tensor::U32Tensor;
use orion::operators::tensor::{TensorTrait, Tensor};
use orion::utils::{assert_eq, assert_seq_eq};
use orion::operators::tensor::I32TensorPartialEq;
use orion::operators::tensor::I32Tensor;
use core::array::{ArrayTrait, SpanTrait};

#[test]
#[available_gas(2000000000)]
fn test_compress_i32_3d_axis2() {
    let input_0 = input_0::input_0();
    let input_1 = input_1::input_1();
    let z_0 = output_0::output_0();

    let y_0 = input_0.compress(condition: input_1, axis: Option::Some(2));

    assert_eq(y_0, z_0);
}
