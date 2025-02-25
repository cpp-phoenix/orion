use core::array::{ArrayTrait, SpanTrait};
use orion::operators::tensor::{TensorTrait, Tensor};
use orion::operators::tensor::I8Tensor;
use orion::numbers::{IntegerTrait, i8};

fn input_0() -> Tensor<i8> {
    let mut shape = ArrayTrait::<usize>::new();
    shape.append(6);

    let mut data = ArrayTrait::new();
    data.append(i8 { mag: 1, sign: true });
    data.append(i8 { mag: 0, sign: false });
    data.append(IntegerTrait::NEG_INF());
    data.append(i8 { mag: 8, sign: false });
    data.append(IntegerTrait::POS_INF());
    data.append(IntegerTrait::NEG_INF());
    TensorTrait::new(shape.span(), data.span())
}
