import { Link } from "react-router";
import { ArrowTopRightOnSquareIcon } from "@heroicons/react/24/solid";
export const SuccessStepPresentational = ({
  tx,
  handle,
  blockExplorer,
}: {
  tx: string;
  handle: string;
  blockExplorer?: string;
}) => {
  return (
    <>
      <p className="text-gray-500">
        <a
          href={`${blockExplorer}/tx/${tx}`}
          target="_blank"
          rel="noopener noreferrer"
          className="text-violet-500 underline"
        >
        </a>
      </p>
      <p className="text-gray-500">
      </p>
      <div className="mt-2 flex justify-center">
        <Link target="_blank" to="https://www.frisco.pl/stn,akcja-strefa_atrakcyjnych_cen_G3_2025/n,strefa_atrakcyjnych_cen_G3_2025?_gl=1*104dkak*_up*MQ..*_ga*OTcyMTkuMTc0MDUyODQ4NA..*_ga_N01VKB5M2C*MTc0MDUyODQ4My4xLjAuMTc0MDUyODQ4My4wLjAuMA..&kat165" id="nextButton">
          Make an order
        </Link>
      </div>
    </>
  );
};
