import axios from "axios";
import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import Spinner from "../Component/Spinner";
import SmallSpinner from "../Component/SmallSpinner";

const ChangeUserInfo = () => {
    const [loader, setLoader] = useState(true);
    const [user, setUser] = useState([]);

    const [username, setUsername] = useState("");
    const [email, setEmail] = useState("");

    const [address, setAddress] = useState("");
    const [phone, setPhone] = useState("");
    const [image, setImage] = useState("");

    const user_id = window.auth.id;

    useEffect(() => {
        axios.get("/api/user-info?user_id=" + user_id).then((d) => {
            const { data } = d;

            setUser(data.data);
            setLoader(false);
        });
    }, []);
    const handleSubmit = (event) => {
        event.preventDefault();
        let data = new FormData();
        data.append("user_id", user_id);
        data.append("username", username);
        data.append("email", email);
        data.append("address", address);
        data.append("phone", phone);
        data.append("image", image);

        axios.post("api/update-info", data).then((d) => {
            const { data } = d;
            console.log(d);

            if (data.data === "Pleas must choose Photo") {
                showToast("Pleas must choose Photo");
            } else {
                if (data.data === "F​ail Update") {
                    showToast("F​ail Update");
                } else {
                    showToast("Update Success");
                }
            }
        });
    };
    return (
        <>
            {loader && <Spinner />}
            {!loader && (
                <div style={{ width: "100rem", margin: "40px auto " }}>
                    <form onSubmit={handleSubmit}>
                        <div className="form-row">
                            <div className="form-group col-md-6">
                                <label htmlFor="inputEmail4">Name</label>
                                <input
                                    type="text"
                                    className="form-control"
                                    id="name"
                                    name="name"
                                    onChange={(e) =>
                                        setUsername(e.target.value)
                                    }
                                />
                            </div>
                            <div className="form-group col-md-6">
                                <label htmlFor="inputPassword4">Email</label>
                                <input
                                    type="email"
                                    className="form-control"
                                    id="email"
                                    name="email"
                                    onChange={(e) => setEmail(e.target.value)}
                                />
                            </div>
                        </div>

                        <div className="form-group">
                            <label htmlFor="inputAddress">Address</label>
                            <input
                                type="text"
                                className="form-control"
                                id="address"
                                name="address"
                                onChange={(e) => setAddress(e.target.value)}
                            />
                        </div>
                        <div className="form-group">
                            <label htmlFor="inputAddress2">Phone</label>
                            <input
                                type="text"
                                className="form-control"
                                id="phone"
                                name="phone"
                                onChange={(e) => setPhone(e.target.value)}
                            />
                        </div>
                        <div className="form-group">
                            <label htmlFor="exampleFormControlFile1">
                                Image
                            </label>

                            <input
                                type="file"
                                className="form-control-file"
                                id="image"
                                name="image"
                                onChange={(e) => setImage(e.target.files[0])}
                            />
                            <img
                                src={user.image_url}
                                width={100}
                                height={100}
                                alt=""
                                className="mt-4"
                            />
                        </div>

                        <button type="submit" className="btn btn-primary">
                            Update
                        </button>
                    </form>
                </div>
            )}
        </>
    );
};

export default ChangeUserInfo;
