use core::array::{ArrayTrait, SpanTrait};
use orion::operators::tensor::{TensorTrait, Tensor};
use orion::operators::tensor::FP16x16Tensor;
use orion::numbers::{FixedTrait, FP16x16};

fn input_2() -> Tensor<FP16x16> {
    let mut shape = ArrayTrait::<usize>::new();
    shape.append(5);

    let mut data = ArrayTrait::new();
    data.append(FP16x16 { mag: 41329, sign: true });
    data.append(FP16x16 { mag: 41872, sign: true });
    data.append(FP16x16 { mag: 18851, sign: true });
    data.append(FP16x16 { mag: 38714, sign: true });
    data.append(FP16x16 { mag: 67617, sign: true });
    TensorTrait::new(shape.span(), data.span())
}
