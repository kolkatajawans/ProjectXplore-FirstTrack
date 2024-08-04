'use client'
import React, { useEffect, useState } from "react";
import { Card, CardContent, CardDescription, CardFooter, CardTitle } from "./ui/card";
import { Label } from "@radix-ui/react-label";
import { Button } from "./ui/button";
import { ComboboxDemo } from "./ui/combobox";
import Linkfiled from "./ui/Linkfiled";
import Mediainput from "./ui/mediainput";
import { Textarea } from "./ui/textarea";
import { Input } from "./ui/input";
import useUser from "@/lib/hooks/useUser";
import { getCookie } from "cookies-next";
import axios from "axios";
import { domain } from "@/lib/domain";
import { useAtom } from "jotai";
import { userAtom } from "@/lib/atoms/userAtom";

const Project = () => {
    const [user] = useAtom(userAtom);
    console.log(user);
    useEffect(()=>{
    },[user])
    const [ProjectChoice, setProjectChoice] = useState<string>("1");
    const [linkfields, setlinkfields] = useState<any>([ { id: 1,link: "" }]);
    const [name,setname] = useState<string >("");
    const [desc,setdesc] = useState<string>("");
    const [mediaFiles,setmediaFiles] = useState<File[]>([]);
    const handlemediaChange = (files: File[])=>{
        setmediaFiles(files);
    }
    const handleLinkChange = (id:any,value:string)=>{
        setlinkfields(linkfields.map((field:any)=>{
            if(field.id ==id){
                return {...field, link:value}
            }
            return field;
        }))
    }

    const projectsarray = [
        { value: "1", label: "Create Project" },
        { value: "2", label: "Update Project" },
    ];

    const addField = (event: any) => {
        event.preventDefault();
        setlinkfields([...linkfields, { id: linkfields.length + 1 }]);
    };
    const deleteField = (id: number) => {
        setlinkfields(linkfields.filter((field: any) => field.id != id));
    };

    const handleProjectValueChange = (newValue: string) => {
        setProjectChoice(newValue);
    };
    const handleSubmit =async ()=>{
        const links = linkfields.map((field:any)=>field.link);
        

        console.log(name,desc,links,mediaFiles)
    }
    return (
        <Card className="w-full flex flex-col justify-center items-start">
            <CardTitle className="w-full flex justify-start">
                <ComboboxDemo
                    frameworks={projectsarray}
                    placeholder="Select a project..."
                    defaultValue={ProjectChoice}
                    onValueChange={handleProjectValueChange}
                />
            </CardTitle>
            <CardDescription className="w-full flex justify-start py-2">
                Share your new project
                {/* {token} */}
            </CardDescription>
            <CardContent className="w-full flex justify-center px-7">
                <form className="w-full flex justify-center flex-1">
                    <div className="flex flex-col w-full items-center gap-4 justify-center flex-1">
                        <div className="flex flex-col space-y-1.5 w-full justify-center">
                            <Label
                                htmlFor="name"
                                className="w-full justify-start "
                            >
                                Name
                            </Label>
                            <Input
                            value={name}
                            onChange={(e:any)=>setname(e.target.value)}
                                id="name"
                                placeholder="Name of your project"
                            />
                        </div>
                        <div className="flex flex-col space-y-1.5 w-full">
                            <Label htmlFor="desc">Description</Label>
                            <Textarea
                                value={desc}
                                onChange={(e:any)=>setdesc(e.target.value)}
                                id="desc"
                                placeholder="Description of your project"
                            />
                        </div>
                        {linkfields.map((field: any) => (
                            <Linkfiled
                                key={field.id}
                                id={field.id}
                                ondelete={deleteField}
                                onChange={handleLinkChange}
                            />
                        ))}
                        <Button type="button" onClick={addField}>
                            Add
                        </Button>
                        <Mediainput onChange={handlemediaChange}/>
                    </div>
                </form>
            </CardContent>
            <CardFooter className="w-full flex justify-center">
                <Button onClick={handleSubmit}>Submit</Button>
            </CardFooter>
        </Card>
    );
};

export default Project;
