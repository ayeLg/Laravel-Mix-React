import axios from "axios";
import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import Spinner from "../Component/Spinner";
import SmallSpinner from "../Component/SmallSpinner";

const Profile = () => {
    const [loader, setLoader] = useState(true);
    const [user, setUser] = useState([]);
    const [qtyLoader, setQtyLoader] = useState(false);

    const user_id = window.auth.id;

    useEffect(() => {
        axios.get("/api/user-info?user_id=" + user_id).then((d) => {
            const { data } = d;

            setUser(data.data);
            setLoader(false);
        });
    }, []);
    return (
        <>
            {loader && <Spinner />}
            {!loader && (
                <div
                    className="card "
                    style={{ width: "50rem", margin: "40px auto " }}
                >
                    <img
                        className=""
                        src={user.image_url}
                        alt="Card image cap"
                        style={{
                            width: "200px",
                            height: "200",
                            margin: "40px auto ",
                        }}
                    />
                    <ul className="list-group list-group-flush">
                        <li className="list-group-item">{user.name}</li>
                        <li className="list-group-item">{user.email}</li>
                        <li className="list-group-item">{user.phone}</li>
                        <li className="list-group-item">{user.address}</li>
                        <li className="list-group-item">**********</li>
                    </ul>
                    <div className="card-body">
                        <Link
                            to={"/profile-update"}
                            className={`btn btn-warning`}
                        >
                            Update
                        </Link>
                    </div>
                </div>
            )}
        </>
    );
};

export default Profile;
