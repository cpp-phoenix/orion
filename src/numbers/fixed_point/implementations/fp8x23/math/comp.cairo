use orion::numbers::fixed_point::implementations::fp8x23::core::{
    FP8x23, FixedTrait, FP8x23PartialOrd, FP8x23PartialEq
};

fn max(a: FP8x23, b: FP8x23) -> FP8x23 {
    if (a >= b) {
        return a;
    } else {
        return b;
    }
}

fn min(a: FP8x23, b: FP8x23) -> FP8x23 {
    if (a <= b) {
        return a;
    } else {
        return b;
    }
}

fn xor(a: FP8x23, b: FP8x23) -> bool {
    if (a == FixedTrait::new(0, false) || b == FixedTrait::new(0, false)) && (a != b) {
        return true;
    } else {
        return false;
    }
}

fn or(a: FP8x23, b: FP8x23) -> bool {
    let zero = FixedTrait::new(0, false);
    if a == zero && b == zero {
        return false;
    } else {
        return true;
    }
}

fn and(a: FP8x23, b: FP8x23) -> bool {
    let zero = FixedTrait::new(0, false);
    if a == zero || b == zero {
        return false;
    } else {
        return true;
    }
}

fn where(a: FP8x23, b: FP8x23, c: FP8x23) -> FP8x23 {
    if a == FixedTrait::new(0, false) {
        return c;
    } else {
        return b;
    }
}

fn bitwise_and(a: FP8x23, b: FP8x23) -> FP8x23 {
    return FixedTrait::new(a.mag & b.mag, a.sign & b.sign);
}

fn bitwise_xor(a: FP8x23, b: FP8x23) -> FP8x23 {
    return FixedTrait::new(a.mag ^ b.mag, a.sign ^ b.sign);
}

fn bitwise_or(a: FP8x23, b: FP8x23) -> FP8x23 {
    return FixedTrait::new(a.mag | b.mag, a.sign | b.sign);
}

// Tests --------------------------------------------------------------------------------------------------------------

#[cfg(test)]
mod tests {
    use super::{FixedTrait, max, min, bitwise_and, bitwise_xor, bitwise_or};

    #[test]
    fn test_max() {
        let a = FixedTrait::new_unscaled(1, false);
        let b = FixedTrait::new_unscaled(0, false);
        let c = FixedTrait::new_unscaled(1, true);

        assert(max(a, a) == a, 'max(a, a)');
        assert(max(a, b) == a, 'max(a, b)');
        assert(max(a, c) == a, 'max(a, c)');

        assert(max(b, a) == a, 'max(b, a)');
        assert(max(b, b) == b, 'max(b, b)');
        assert(max(b, c) == b, 'max(b, c)');

        assert(max(c, a) == a, 'max(c, a)');
        assert(max(c, b) == b, 'max(c, b)');
        assert(max(c, c) == c, 'max(c, c)');
    }

    #[test]
    fn test_min() {
        let a = FixedTrait::new_unscaled(1, false);
        let b = FixedTrait::new_unscaled(0, false);
        let c = FixedTrait::new_unscaled(1, true);

        assert(min(a, a) == a, 'min(a, a)');
        assert(min(a, b) == b, 'min(a, b)');
        assert(min(a, c) == c, 'min(a, c)');

        assert(min(b, a) == b, 'min(b, a)');
        assert(min(b, b) == b, 'min(b, b)');
        assert(min(b, c) == c, 'min(b, c)');

        assert(min(c, a) == c, 'min(c, a)');
        assert(min(c, b) == c, 'min(c, b)');
        assert(min(c, c) == c, 'min(c, c)');
    }
    #[test]
    fn test_bitwise_and() {
        let a = FixedTrait::new(28835840, false); // 3.4375
        let b = FixedTrait::new(1639448576, true); // -60.5625

        assert(bitwise_and(a, b) == a, 'bitwise_and(a,b)')
    }

    #[test]
    fn test_bitwise_xor() {
        let a = FixedTrait::new(28835840, false); // 3.4375
        let b = FixedTrait::new(1639448576, true); // -60.5625
        let c = FixedTrait::new(1610612736, true);

        assert(bitwise_xor(a, b) == c, 'bitwise_xor(a,b)')
    }

    fn test_bitwise_or() {
        let a = FixedTrait::new(28835840, false); // 3.4375
        let b = FixedTrait::new(1639448576, true); // -60.5625

        assert(bitwise_or(a, b) == b, 'bitwise_or(a,b)')
    }
}
