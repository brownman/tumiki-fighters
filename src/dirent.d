import std.string;

extern (C) {
	alias void DIR;
	alias void dirent;
	DIR* opendir(char* name);
	dirent* readdir(DIR* dir);
	int closedir(DIR* dir);
	char* readdir_filename(DIR* ent);
}
