import React from "react";
import { Label } from "./label";
import { Input } from "./input";
import { Button } from "./button";
import { Minus } from "lucide-react";

const Linkfiled = ({ id,ondelete }:{id:any,ondelete: (id:number)=> void}) => {
    return (
        <div className="flex items-center gap-4 w-full">
        <div className="flex flex-col space-y-1.5 w-full">
            <Label htmlFor={`link-${id}`}>Usefull Link</Label>
            <Input id={`link-${id}`} placeholder="xyz.com" />
        </div>
        <button onClick={()=>ondelete(id)} className="mt-5 border-2 border-dashed border-black p-1 rounded-md"><Minus/></button>
        </div>
    );
};

export default Linkfiled;
