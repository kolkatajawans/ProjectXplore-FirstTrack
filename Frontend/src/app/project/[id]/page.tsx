"use client";
import { useState, useEffect } from "react";
import axios from "axios";
import { domain } from "@/lib/domain";
import { Facebook, Github, Linkedin, Youtube } from 'lucide-react';

export default function Page({ params }: { params: { id: string } }) {
    const [projectName, setProjectName] = useState<string>("");
    const [creator, setCreator] = useState<string>("");
    const [description, setDescription] = useState<string>("");
    const [links, setLinks] = useState<any[]>([]);
    const [imageLinks, setImageLinks] = useState<any[]>([]);
    const [collaborators, setCollaborators] = useState<any[]>([]);
    const [roomName, setRoomName] = useState<string>("");
    const [createdAt, setCreatedAt] = useState<string>("");
    const [likes, setLikes] = useState<number>(0);
    const [comments, setComments] = useState<any[]>([]);
    const [newComment, setNewComment] = useState<string>("");
    const getData = async () => {
        try {
            const response = await axios.get(`${domain}/api/v1/project/get`, {
                params: { projectId: params.id },
            });

            const project = response.data;

            setProjectName(project.name);
            setCreator(project.author?.name || "Unknown");
            setDescription(project.description);
            setLinks(project.links || []);
            setImageLinks(project.images || []);
            setCollaborators(
                project.room?.members.map((member: any) => member.user) || []
            );
            setRoomName(project.room?.name || "N/A");
            setCreatedAt(new Date(project.createdAt).toLocaleDateString());
            setLikes(project.likes || 0);
            setComments(project.comments || []);
        } catch (error) {
            console.error("Error fetching project data:", error);
        }
    };

    useEffect(() => {
        getData();
    }, [params.id]);

    return (
        <main className="w-screen min-h-screen max-h-full px-[300px] m-0 flex flex-col">
            <div id="header" className="flex flex-col w-full p-3">
                <div id="title" className=" text-[40px] font-bold">
                    {projectName}
                </div>
                <div id="creator">{creator}</div>
            </div>
            <div id="body" className="p-2 w-full">
                <div id="descLink" className="flex">
                    <div id="desc" className="flex-grow flex p-5 text-gray-600 shadow-lg mr-5 rounded-xl">
                        {description}
                    </div>
                    <div
                        id="usefulLink"
                        className="flex flex-col w-full border-2 rounded-lg p-4"
                    >
                        <div className="p-3 text-[20px] font-extrabold">
                            Useful Links
                        </div>
                        <div >
                            {links.map((link, index) => (
                                <div key={index} className="flex">
                                    <div className="w-7 flex justify-center items-center py-2">
                                        {link.url.includes('github') && <Github/>}
                                        {link.url.includes('youtube') && <Youtube/>}
                                        {link.url.includes('linkedin') && <Linkedin/>}
                                        {link.url.includes('facebook') && <Facebook/>}

                                    </div>
                                    <a
                                        href={link.url}
                                        target="_blank"
                                        className="text-blue-600 hover:text-blue-800 flex justify-center items-center"
                                    >
                                        {link.url}
                                    </a>
                                </div>
                            ))}
                        </div>
                    </div>
                </div>
            </div>
        </main>
    );
}
