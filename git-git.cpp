#include <string>
#include <iostream>
#include <process.h>

std::wstring create_git_arguments(
  int argc,
  wchar_t *argv[],
  int start_index = 1)
{
  std::wstring result = L"";
  
  for (int i = start_index; i < argc; ++i) {
    result.append(L"\"");
    result.append(argv[i]);
    result.append(L"\" ");
  }
  
  return result;
}

void print_error(int errnum) {
  const rsize_t ERR_MSG_MAX = 94;
  
  if (errnum) {
    wchar_t buff[ERR_MSG_MAX + 1];
    _wcserror_s(buff, errnum);
    std::wcerr.imbue(std::locale(""));
    std::wcerr << buff << std::endl;
  }
}

int wmain(int argc, wchar_t *argv[]) {
  auto git_args = create_git_arguments(argc, argv);
  auto git_cl = L"git " + git_args;
  
  int code = _wsystem(git_cl.c_str());
  print_error(errno);
  
  return code;
}
