import axios from "axios";
import React, { useEffect, useState } from "react";
import Spinner from "../Component/Spinner";
import SmallSpinner from "../Component/SmallSpinner";

const Cart = () => {
    const [loader, setLoader] = useState(true);
    const [cart, setCart] = useState([]);
    const [qtyLoader, setQtyLoader] = useState(false);

    const user_id = window.auth.id;

    useEffect(() => {
        axios.get("/api/get-cart?user_id=" + user_id).then((d) => {
            const { data } = d;

            setCart(data.data);
            setLoader(false);
        });
    }, []);

    // update cart qty
    const updateCart = (id, type) => {
        const updatedCart = cart.map((d) => {
            if (id == d.id) {
                switch (type) {
                    case "add":
                        d.total_quantity += 1;
                        break;

                    default:
                        d.total_quantity -= 1;
                        break;
                }
            }
            return d;
        });

        setCart(updatedCart);
    };

    // update qty
    const updateQty = (id, qty) => {
        setQtyLoader(id);
        axios
            .post("/api/update-cart-qty", { cart_id: id, total_qty: qty })
            .then((d) => {
                if (d.data.message === true) {
                    showToast("Cart Quantity Updated");
                    setQtyLoader(false);
                }
            });
    };

    // remove Cart
    const removeCart = (id) => {
        axios.post("/api/remove-cart", { cart_id: id }).then((d) => {
            if (d.data.message === true) {
                setCart((preCart) => preCart.filter((d) => d.id !== id));
                showToast("Product Removed From Cart");
            }
        });
    };

    const TotalPrice = () => {
        var total_price = 0;
        cart.map((d) => {
            total_price += d.product.sale_price * d.total_quantity;
        });
        return <span>{total_price}</span>;
    };

    // checkout
    const checkout = () => {
        const user_id = window.auth.id;
        axios.post("/api/checkout?user_id=" + user_id).then((d) => {
            if (d.data.message === true) {
                setCart([]);
                window.updateCart(0);
                showToast(
                    "Checkout Success. Please Wait For Shop Owner. You can View In Order List Tab."
                );
            }
        });
    };

    return (
        <div>
            {" "}
            <div className="container-fluid mt-3">
                <div className="card p-3 ">
                    <h4>Cart</h4>

                    {loader && <Spinner />}
                    {!loader && (
                        <>
                            <table className="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Image</th>
                                        <th>Name</th>
                                        <th>Quantity</th>
                                        <th>Sale Price</th>
                                        <th>Add/Remove</th>
                                        <th>Delete</th>
                                        <th>Total Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {cart.map((d) => (
                                        <tr key={d.id}>
                                            <td>
                                                <img
                                                    style={{ width: 50 }}
                                                    src={d.product.image_url}
                                                    alt={d.product.name}
                                                />
                                            </td>
                                            <td>{d.product.name}</td>
                                            <td>{d.total_quantity}</td>
                                            <td>{d.product.sale_price}</td>
                                            <td>
                                                <button
                                                    className="btn btn-dark btn-sm"
                                                    onClick={() =>
                                                        updateCart(
                                                            d.id,
                                                            "reduce"
                                                        )
                                                    }
                                                >
                                                    -
                                                </button>
                                                <input
                                                    type="text"
                                                    className="btn border-warning"
                                                    value={d.total_quantity}
                                                    disabled={true}
                                                />
                                                <button
                                                    className="btn btn-dark btn-sm"
                                                    onClick={() =>
                                                        updateCart(d.id, "add")
                                                    }
                                                >
                                                    +
                                                </button>
                                                <button
                                                    className="btn btn-sm btn-primary"
                                                    onClick={() =>
                                                        updateQty(
                                                            d.id,
                                                            d.total_quantity
                                                        )
                                                    }
                                                >
                                                    {qtyLoader === d.id && (
                                                        <SmallSpinner />
                                                    )}
                                                    Save
                                                </button>
                                            </td>
                                            <td>
                                                <button
                                                    className="btn btn-sm btn-danger"
                                                    onClick={() =>
                                                        removeCart(d.id)
                                                    }
                                                >
                                                    <i className="fa fa-trash"></i>
                                                </button>
                                            </td>
                                            <td className="bg-dark text-white">
                                                {d.product.sale_price *
                                                    d.total_quantity}
                                            </td>
                                        </tr>
                                    ))}
                                    <tr>
                                        <td colSpan={6}>
                                            {" "}
                                            <span className="float-right">
                                                {" "}
                                                Total :{" "}
                                            </span>
                                        </td>
                                        <td>
                                            <TotalPrice />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div>
                                <button
                                    className="btn btn-primary"
                                    onClick={() => checkout()}
                                >
                                    Checkout
                                </button>
                            </div>
                        </>
                    )}
                </div>
            </div>
        </div>
    );
};

export default Cart;
