import React, { useState } from "react";
import { Input } from "./input";
import { X } from "lucide-react";

const Mediainput = () => {
    const [img, setimg] = useState<File[]>([]);
    const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        if (e.target.files) {
            const newFiles = Array.from(e.target.files);
            setimg((previmg) => [...previmg, ...newFiles]);
        }
    };
    const handleDelete = (index: number) => {
        setimg((prevImg) => prevImg.filter((_, i) => i !== index));
    };
    return (
        <div className="w-full">
            <Input type="file" multiple onChange={handleChange} />
            <div style={{ display: "flex", flexWrap: "wrap" }}>
                {img.map((file, index) => (
                    <div key={index} style={{ margin: "10px" }}>
                        <button
                            onClick={() => handleDelete(index)}
                            className="absolute cursor-pointer backdrop-blur-xl text-gray-600 rounded-full m-1"
                        >
                            <X/>
                        </button>
                        <img
                            src={URL.createObjectURL(file)}
                            alt={`uploaded-${index}`}
                            style={{
                                width: "100px",
                                height: "100px",
                                objectFit: "cover",
                            }}
                            className="rounded-md m-2"
                        />
                    </div>
                ))}
            </div>
        </div>
    );
};

export default Mediainput;
