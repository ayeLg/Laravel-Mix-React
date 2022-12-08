import axios from "axios";
import React, { useState } from "react";
import SmallSpinner from "../Component/SmallSpinner";

const ChangePassword = () => {
    const [currentPassword, setCurrentPassword] = useState("");
    const [newPassword, setNewPassword] = useState("");
    const [confirmPassword, setConfirmPassword] = useState("");
    const [loader, setLoader] = useState(false);

    const changePassword = () => {
        setLoader(true);
        if (newPassword !== confirmPassword) {
            showToast("Wrong Confirm Password", "error");
        } else {
            axios
                .post("/api/change-password?user_id=" + window.auth.id, {
                    currentPassword,
                    newPassword,
                })
                .then((d) => {
                    setLoader(false);
                    const { data } = d;
                    if (data.message === false) {
                        showToast("Wrong Current Password", "error");
                    } else {
                        showToast(
                            "Password change successfully, use your password at next login time"
                        );
                    }
                });
        }
    };

    return (
        <div className="container mt-3">
            <div className="card p-5">
                <div className="form-group">
                    <label htmlFor="">Enter Current Password</label>
                    <input
                        type="password"
                        name=""
                        className="form-control"
                        id=""
                        onChange={(e) => setCurrentPassword(e.target.value)}
                    />
                </div>
                <div className="form-group">
                    <label htmlFor="">Enter New Password</label>
                    <input
                        type="password"
                        name=""
                        className="form-control"
                        id=""
                        onChange={(e) => setNewPassword(e.target.value)}
                    />
                </div>
                <div className="form-group">
                    <label htmlFor="">Confirm New Password</label>
                    <input
                        type="password"
                        name=""
                        className="form-control"
                        id=""
                        onChange={(e) => setConfirmPassword(e.target.value)}
                    />
                </div>
                <div>
                    <button
                        className="btn btn-dark"
                        onClick={() => changePassword()}
                    >
                        {loader && <SmallSpinner />}
                        change
                    </button>
                </div>
            </div>
        </div>
    );
};

export default ChangePassword;
